import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:clipboard/base/constants/strings/strings.dart';
import 'package:clipboard/base/domain/model/clip_collection/clipcollection.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/sources/clip_collection.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/platform_os.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class BackupSummary {
  final int collectionsTotal;
  final int clipsTotal;
  final int cachedFilesIncluded;
  final int cachedFilesMissing;
  final int cachedFilesSkippedBySize;
  final int encryptedClipsInBackup;
  final String outputPath;

  const BackupSummary({
    required this.collectionsTotal,
    required this.clipsTotal,
    required this.cachedFilesIncluded,
    required this.cachedFilesMissing,
    required this.cachedFilesSkippedBySize,
    required this.encryptedClipsInBackup,
    required this.outputPath,
  });
}

class RestoreSummary {
  final int collectionsRestored;
  final int collectionsDuplicate;
  final int collectionsFailed;
  final int clipsRestored;
  final int clipsDuplicate;
  final int clipsFailed;
  final int attachmentsRestored;
  final int attachmentsMissing;
  final int attachmentsFailed;
  final int corruptEntries;

  const RestoreSummary({
    required this.collectionsRestored,
    required this.collectionsDuplicate,
    required this.collectionsFailed,
    required this.clipsRestored,
    required this.clipsDuplicate,
    required this.clipsFailed,
    required this.attachmentsRestored,
    required this.attachmentsMissing,
    required this.attachmentsFailed,
    required this.corruptEntries,
  });
}

class ManualBackupRestoreService {
  static const String _payloadEntry = 'payload.json';
  static const int _pageSize = 300;

  final ClipboardSource _localClipSource;
  final ClipCollectionSource _localCollectionSource;

  ManualBackupRestoreService(
    this._localClipSource,
    this._localCollectionSource,
  );

  Future<BackupSummary> createBackup({
    String? password,
    required bool includeCachedFiles,
    required bool encryptClipsInBackup,
    required Set<ClipItemType> clipTypes,
    DateTime? fromDate,
    DateTime? toDate,
    int? maxFileSizeBytes,
  }) async {
    final collections = await _fetchAllCollections();
    final clips = await _fetchAllClips();

    final localCollectionIds = <int, bool>{};

    for (final collection in collections) {
      if (collection.id != null) {
        localCollectionIds[collection.id!] = true;
      }
    }

    var cachedFilesIncluded = 0;
    var cachedFilesMissing = 0;
    var cachedFilesSkippedBySize = 0;
    var encryptedClipsInBackup = 0;

    final cacheDir = await getApplicationCacheDirectory();
    final pathWithExtension = p.join(
      cacheDir.path,
      'copycat_backup_${DateTime.now().millisecondsSinceEpoch}.ccbkup',
    );

    final password_ = password?.trim();
    final zipEncoder = ZipFileEncoder(
      password: password_ == null || password_.isEmpty ? null : password_,
    );

    final tempDir = await cacheDir.createTemp('copycat_backup_');
    final payloadPath = p.join(tempDir.path, _payloadEntry);
    final payloadFile = File(payloadPath);

    var includedClipCount = 0;

    try {
      final payloadSink = payloadFile.openWrite();

      payloadSink.write('{"schemaVersion":1');
      payloadSink.write(
        ',"createdAt":${jsonEncode(DateTime.now().toUtc().toIso8601String())}',
      );
      payloadSink.write(',"collections":[');

      var wroteCollection = false;
      for (final collection in collections) {
        if (wroteCollection) {
          payloadSink.write(',');
        }
        payloadSink.write(jsonEncode(_collectionToMap(collection)));
        wroteCollection = true;
      }

      payloadSink.write('],"clips":[');

      zipEncoder.create(pathWithExtension, level: DeflateLevel.bestSpeed);

      var wroteClip = false;
      for (var clip in clips) {
        if (!clipTypes.contains(clip.type)) {
          continue;
        }
        if (!_withinDateRange(
          clip.created,
          fromDate: fromDate,
          toDate: toDate,
        )) {
          continue;
        }

        String? attachmentArchivePath;

        if (encryptClipsInBackup &&
            !clip.encrypted &&
            (clip.isTextType ||
                (clip.type == ClipItemType.file &&
                    clip.text?.trim().isNotEmpty == true))) {
          clip = await clip.encrypt();
        }

        if (clip.encrypted) {
          encryptedClipsInBackup++;
        }

        if (includeCachedFiles && clip.localPath != null && clip.inCache) {
          final file = File(clip.localPath!);
          if (await file.exists()) {
            final size = await file.length();
            if (maxFileSizeBytes != null && size > maxFileSizeBytes) {
              cachedFilesSkippedBySize++;
            } else {
              final safeName = p.basename(file.path);
              attachmentArchivePath = 'files/${getId()}_$safeName';
              await zipEncoder.addFile(
                file,
                attachmentArchivePath,
                ZipFileEncoder.gzip,
              );
              cachedFilesIncluded++;
            }
          } else {
            cachedFilesMissing++;
          }
        }

        final backupCollectionId =
            clip.collectionId != null &&
                localCollectionIds.containsKey(clip.collectionId)
            ? clip.collectionId
            : null;

        final clipMap = _clipToMap(
          clip,
          backupCollectionId: backupCollectionId,
          attachmentArchivePath: attachmentArchivePath,
        );

        if (wroteClip) {
          payloadSink.write(',');
        }
        payloadSink.write(jsonEncode(clipMap));
        wroteClip = true;
        includedClipCount++;
      }

      payloadSink.write(']}');
      await payloadSink.flush();
      await payloadSink.close();

      await zipEncoder.addFile(payloadFile, _payloadEntry, ZipFileEncoder.gzip);
      await zipEncoder.close();
    } finally {
      if (await payloadFile.exists()) {
        await payloadFile.delete();
      }
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
    }

    return BackupSummary(
      collectionsTotal: collections.length,
      clipsTotal: includedClipCount,
      cachedFilesIncluded: cachedFilesIncluded,
      cachedFilesMissing: cachedFilesMissing,
      cachedFilesSkippedBySize: cachedFilesSkippedBySize,
      encryptedClipsInBackup: encryptedClipsInBackup,
      outputPath: pathWithExtension,
    );
  }

  Future<RestoreSummary> restoreBackup({
    required String backupPath,
    String? password,
  }) async {
    final password_ = password?.trim();
    final input = InputFileStream(backupPath);
    final archive = ZipDecoder().decodeStream(
      input,
      verify: true,
      password: (password_ == null || password_.isEmpty) ? null : password_,
    );
    input.closeSync();

    final fileMap = <String, ArchiveFile>{};
    for (final file in archive.files) {
      fileMap[file.name] = file;
    }

    final payloadFile = fileMap[_payloadEntry];
    if (payloadFile == null) {
      throw Exception('Invalid backup file: payload missing.');
    }

    final payloadBytes = _readArchiveBytes(payloadFile);
    final payloadString = utf8.decode(payloadBytes);
    final payload = jsonDecode(payloadString) as Map<String, dynamic>;

    final collectionsData = (payload['collections'] as List<dynamic>? ?? []);
    final clipsData = (payload['clips'] as List<dynamic>? ?? []);

    final existingCollections = await _fetchAllCollections();
    final existingCollectionServerIds = <int, ClipCollection>{
      for (final c in existingCollections)
        if (c.serverId != null) c.serverId!: c,
    };
    final existingCollectionFingerprints = <String, ClipCollection>{
      for (final c in existingCollections) _collectionFingerprint(c): c,
    };

    final backupLocalCollectionIdToCurrentId = <int, int>{};

    var collectionsRestored = 0;
    var collectionsDuplicate = 0;
    var collectionsFailed = 0;

    for (final entry in collectionsData) {
      if (entry is! Map<String, dynamic>) {
        collectionsFailed++;
        continue;
      }

      try {
        final backupLocalId = _toInt(entry['backupLocalId']);
        final collection = _mapToCollection(entry);

        ClipCollection? duplicate;
        if (collection.serverId != null) {
          duplicate = existingCollectionServerIds[collection.serverId!];
        }
        duplicate ??=
            existingCollectionFingerprints[_collectionFingerprint(collection)];

        if (duplicate != null) {
          collectionsDuplicate++;
          if (backupLocalId != null && duplicate.id != null) {
            backupLocalCollectionIdToCurrentId[backupLocalId] = duplicate.id!;
          }
          continue;
        }

        final created = await _localCollectionSource.create(collection);
        collectionsRestored++;
        if (backupLocalId != null && created.id != null) {
          backupLocalCollectionIdToCurrentId[backupLocalId] = created.id!;
        }
        if (created.serverId != null) {
          existingCollectionServerIds[created.serverId!] = created;
        }
        existingCollectionFingerprints[_collectionFingerprint(created)] =
            created;
      } catch (error, trace) {
        logger.w('Collection restore failed: $error\n$trace');
        collectionsFailed++;
      }
    }

    final existingClips = await _fetchAllClips();
    final existingClipServerIds = <int, ClipboardItem>{
      for (final c in existingClips)
        if (c.serverId != null) c.serverId!: c,
    };
    final existingClipFingerprints = <String, ClipboardItem>{
      for (final c in existingClips) _clipFingerprint(c): c,
    };

    var clipsRestored = 0;
    var clipsDuplicate = 0;
    var clipsFailed = 0;
    var attachmentsRestored = 0;
    var attachmentsMissing = 0;
    var attachmentsFailed = 0;
    var corruptEntries = 0;

    for (final entry in clipsData) {
      if (entry is! Map<String, dynamic>) {
        corruptEntries++;
        continue;
      }

      try {
        final backupCollectionId = _toInt(entry['backupCollectionId']);
        final mappedCollectionId = backupCollectionId != null
            ? backupLocalCollectionIdToCurrentId[backupCollectionId]
            : null;

        final attachmentPath = entry['attachmentArchivePath'] as String?;
        String? localAttachmentPath;

        var clip = _mapToClip(entry, mappedCollectionId: mappedCollectionId);

        if (attachmentPath != null) {
          final archiveFile = fileMap[attachmentPath];
          if (archiveFile == null) {
            attachmentsMissing++;
          } else {
            try {
              localAttachmentPath = await _restoreAttachment(clip, archiveFile);
              attachmentsRestored++;
            } catch (error, trace) {
              logger.w('Attachment restore failed: $error\n$trace');
              attachmentsFailed++;
            }
          }
        }

        clip = clip.copyWith(
          localPath: localAttachmentPath,
          localOnly: clip.serverId != null,
        );

        ClipboardItem? duplicate;
        if (clip.serverId != null) {
          duplicate = existingClipServerIds[clip.serverId!];
        }
        duplicate ??= existingClipFingerprints[_clipFingerprint(clip)];

        if (duplicate != null) {
          clipsDuplicate++;
          continue;
        }

        if (clip.encrypted) {
          clip = await clip.decrypt(throwException: true);
        }

        final created = await _localClipSource.create(clip);
        clipsRestored++;

        if (created.serverId != null) {
          existingClipServerIds[created.serverId!] = created;
        }
        existingClipFingerprints[_clipFingerprint(created)] = created;
      } catch (error, trace) {
        logger.w('Clip restore failed: $error\n$trace');
        clipsFailed++;
      }
    }

    return RestoreSummary(
      collectionsRestored: collectionsRestored,
      collectionsDuplicate: collectionsDuplicate,
      collectionsFailed: collectionsFailed,
      clipsRestored: clipsRestored,
      clipsDuplicate: clipsDuplicate,
      clipsFailed: clipsFailed,
      attachmentsRestored: attachmentsRestored,
      attachmentsMissing: attachmentsMissing,
      attachmentsFailed: attachmentsFailed,
      corruptEntries: corruptEntries,
    );
  }

  Future<List<ClipCollection>> _fetchAllCollections() async {
    final all = <ClipCollection>[];
    var offset = 0;
    while (true) {
      final page = await _localCollectionSource.getList(
        limit: _pageSize,
        offset: offset,
      );
      if (page.results.isEmpty) {
        break;
      }
      all.addAll(page.results);
      offset += page.results.length;
      if (!page.hasMore) {
        break;
      }
    }
    return all;
  }

  Future<List<ClipboardItem>> _fetchAllClips() async {
    final all = <ClipboardItem>[];
    var offset = 0;
    while (true) {
      final page = await _localClipSource.getList(
        limit: _pageSize,
        offset: offset,
      );
      if (page.results.isEmpty) {
        break;
      }
      all.addAll(page.results);
      offset += page.results.length;
      if (!page.hasMore) {
        break;
      }
    }
    return all;
  }

  Map<String, dynamic> _collectionToMap(ClipCollection collection) {
    return {
      'backupLocalId': collection.id,
      'serverId': collection.serverId,
      'lastSynced': collection.lastSynced?.toIso8601String(),
      'created': collection.created.toIso8601String(),
      'modified': collection.modified.toIso8601String(),
      'userId': collection.userId,
      'deletedAt': collection.deletedAt?.toIso8601String(),
      'deviceId': collection.deviceId,
      'title': collection.title,
      'description': collection.description,
      'emoji': collection.emoji,
      'color': collection.color,
    };
  }

  ClipCollection _mapToCollection(Map<String, dynamic> map) {
    return ClipCollection(
      id: null,
      serverId: _toInt(map['serverId']),
      lastSynced: _toDateTime(map['lastSynced']),
      created: _toDateTime(map['created']) ?? systemTime(),
      modified: _toDateTime(map['modified']) ?? systemTime(),
      userId: _toString(map['userId']) ?? kLocalUserId,
      deletedAt: _toDateTime(map['deletedAt']),
      deviceId: _toString(map['deviceId']),
      title: _toString(map['title']) ?? 'Untitled Collection',
      description: _toString(map['description']),
      emoji: _toString(map['emoji']) ?? '📁',
      color: _toInt(map['color']),
    );
  }

  Map<String, dynamic> _clipToMap(
    ClipboardItem clip, {
    int? backupCollectionId,
    String? attachmentArchivePath,
  }) {
    return {
      'serverId': clip.serverId,
      'lastSynced': clip.lastSynced?.toIso8601String(),
      'created': clip.created.toIso8601String(),
      'modified': clip.modified.toIso8601String(),
      'deviceId': clip.deviceId,
      'type': clip.type.name,
      'userId': clip.userId,
      'title': clip.title,
      'description': clip.description,
      'deletedAt': clip.deletedAt?.toIso8601String(),
      'encrypted': clip.encrypted,
      'iv': clip.iv,
      'encMode': clip.encMode,
      'text': clip.text,
      'url': clip.url,
      'textCategory': clip.textCategory?.name,
      'fileName': clip.fileName,
      'fileMimeType': clip.fileMimeType,
      'fileExtension': clip.fileExtension,
      'driveFileId': clip.driveFileId,
      'fileSize': clip.fileSize,
      'imgBlurHash': clip.imgBlurHash,
      'sourceUrl': clip.sourceUrl,
      'sourceApp': clip.sourceApp,
      'sourceId': clip.sourceId,
      'os': clip.os.name,
      'serverCollectionId': clip.serverCollectionId,
      'backupCollectionId': backupCollectionId,
      'localOnly': clip.localOnly,
      'copiedCount': clip.copiedCount,
      'lastCopied': clip.lastCopied?.toIso8601String(),
      'attachmentArchivePath': attachmentArchivePath,
    };
  }

  ClipboardItem _mapToClip(
    Map<String, dynamic> map, {
    int? mappedCollectionId,
  }) {
    final type =
        _toEnum<ClipItemType>(ClipItemType.values, map['type']) ??
        ClipItemType.text;

    final textCategory = _toEnum<TextCategory>(
      TextCategory.values,
      map['textCategory'],
    );

    final os =
        _toEnum<PlatformOS>(PlatformOS.values, map['os']) ??
        currentPlatformOS();

    return ClipboardItem(
      id: null,
      serverId: _toInt(map['serverId']),
      lastSynced: _toDateTime(map['lastSynced']),
      localPath: null,
      created: _toDateTime(map['created']) ?? systemTime(),
      modified: _toDateTime(map['modified']) ?? systemTime(),
      deviceId: _toString(map['deviceId']),
      type: type,
      userId: _toString(map['userId']) ?? kLocalUserId,
      title: _toString(map['title']),
      description: _toString(map['description']),
      deletedAt: _toDateTime(map['deletedAt']),
      encrypted: map['encrypted'] == true,
      iv: _toString(map['iv']),
      encMode: _toString(map['encMode']),
      text: _toString(map['text']),
      url: _toString(map['url']),
      textCategory: textCategory,
      fileName: _toString(map['fileName']),
      fileMimeType: _toString(map['fileMimeType']),
      fileExtension: _toString(map['fileExtension']),
      driveFileId: _toString(map['driveFileId']),
      fileSize: _toInt(map['fileSize']),
      imgBlurHash: _toString(map['imgBlurHash']),
      sourceUrl: _toString(map['sourceUrl']),
      sourceApp: _toString(map['sourceApp']),
      sourceId: _toString(map['sourceId']),
      os: os,
      serverCollectionId: _toInt(map['serverCollectionId']),
      collectionId: mappedCollectionId,
      localOnly: map['localOnly'] == true,
      copiedCount: _toInt(map['copiedCount']) ?? 0,
      lastCopied: _toDateTime(map['lastCopied']),
    );
  }

  String _collectionFingerprint(ClipCollection collection) {
    final title = collection.title.trim().toLowerCase();
    final emoji = collection.emoji.trim();
    final description = (collection.description ?? '').trim().toLowerCase();
    return '$title|$emoji|$description';
  }

  String _clipFingerprint(ClipboardItem clip) {
    switch (clip.type) {
      case ClipItemType.text:
        return 'text|${(clip.text ?? '').trim().toLowerCase()}';
      case ClipItemType.url:
        return 'url|${(clip.url ?? '').trim().toLowerCase()}';
      case ClipItemType.media:
      case ClipItemType.file:
        final fileName = (clip.fileName ?? '').trim().toLowerCase();
        final mime = (clip.fileMimeType ?? '').trim().toLowerCase();
        final drive = (clip.driveFileId ?? '').trim();
        final size = clip.fileSize ?? -1;
        return '${clip.type.name}|$fileName|$mime|$size|$drive';
    }
  }

  Future<String> _restoreAttachment(
    ClipboardItem clip,
    ArchiveFile archiveFile,
  ) async {
    final bytes = _readArchiveBytes(archiveFile);
    final root = await getPersistedRootDirPath(clip.rootDir);
    final ext = _resolveFileExtension(clip);
    final fileName = (clip.fileName?.trim().isNotEmpty ?? false)
        ? clip.fileName!.trim()
        : 'attachment';

    final outputFile = File(
      p.join(root, '${getId()}_${p.basenameWithoutExtension(fileName)}.$ext'),
    );
    await outputFile.writeAsBytes(bytes, flush: true);
    return outputFile.path;
  }

  String _resolveFileExtension(ClipboardItem clip) {
    final ext = clip.fileExtension?.trim();
    if (ext != null && ext.isNotEmpty) {
      return ext.startsWith('.') ? ext.substring(1) : ext;
    }

    final byName = p
        .extension(clip.fileName ?? '')
        .replaceFirst('.', '')
        .trim();
    if (byName.isNotEmpty) {
      return byName;
    }

    return clip.type == ClipItemType.media ? 'media' : 'bin';
  }

  bool _withinDateRange(
    DateTime created, {
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    if (fromDate != null && created.isBefore(fromDate)) {
      return false;
    }
    if (toDate != null && created.isAfter(toDate)) {
      return false;
    }
    return true;
  }

  Uint8List _readArchiveBytes(ArchiveFile file) {
    final content = file.content;
    if (content.isEmpty) {
      throw Exception('Invalid archive file data for ${file.name}.');
    }
    return Uint8List.fromList(content);
  }

  int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  String? _toString(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  DateTime? _toDateTime(dynamic value) {
    if (value is String && value.trim().isNotEmpty) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  T? _toEnum<T extends Enum>(List<T> values, dynamic value) {
    final name = value?.toString();
    if (name == null) return null;
    for (final enumValue in values) {
      if (enumValue.name == name) return enumValue;
    }
    return null;
  }
}
