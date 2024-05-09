import 'dart:async';
import 'dart:io' as io;

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/constants/numbers/file_sizes.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/oauth2/v2.dart' as oauth2;
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

abstract class DriveService {
  String? accessToken;

  Future<ClipboardItem> upload(
    ClipboardItem item, {
    void Function(int, int)? onProgress,
  });
  Future<ClipboardItem> download(
    ClipboardItem item, {
    void Function(int, int)? onProgress,
  });
  Future<void> delete(ClipboardItem item);

  bool isDownloading(ClipboardItem item);

  void cancelOperation(ClipboardItem item);
}

class GoogleAuthClient with http.BaseClient {
  final String accessToken;

  BehaviorSubject<(int, int)>? progress;
  int? contentLength;
  int currentBytes = 0;
  bool stopped = false;

  GoogleAuthClient(this.accessToken);

  BehaviorSubject<(int, int)> setProgressListener({int? contentLength}) {
    progress ??= BehaviorSubject<(int, int)>();
    this.contentLength ??= contentLength;
    return progress!;
  }

  void unsetProgressListener() {
    progress?.close();
    contentLength = null;
    progress = null;
  }

  @override
  void close() {
    unsetProgressListener();
    stopped = true;
    super.close();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (stopped) {
      throw StateError('Already stopped');
    }
    request.headers["Authorization"] = "Bearer $accessToken";
    final response = await request.send();
    final totalBytes = contentLength ?? 1;
    int currentLength = 0;

    // "range" -> "bytes=0-5505023"
    final range = response.headers["range"];
    if (range != null) {
      final start = int.parse(range.split("=")[1].split("-")[0]);
      final end = int.parse(range.split("=")[1].split("-")[1]);
      if (start == 0) {
        currentLength = end;
      } else {
        currentLength = (end - start + 1) + currentBytes;
      }
    }

    if (currentLength > currentBytes) {
      currentBytes = currentLength;
    }
    progress?.add((currentBytes, totalBytes));
    logger.i('Transfered: $currentBytes / $totalBytes bytes');

    return response;
  }
}

@lazySingleton
class GoogleOAuth2Service {
  String? accessToken;

  GoogleAuthClient get authClient {
    if (accessToken == null) {
      throw Exception('No access token provided');
    }
    return GoogleAuthClient(accessToken!);
  }

  oauth2.Oauth2Api getOAuth([http.Client? client]) =>
      oauth2.Oauth2Api(client ?? authClient);

  Future<oauth2.Tokeninfo> getTokenInfo() async {
    final client = getOAuth();
    return await client.tokeninfo();
  }
}

@Named("google_drive")
@LazySingleton(as: DriveService)
class GoogleDriveService implements DriveService {
  final _uploadOperations = <int, Completer>{};
  final _downloadOperations = <int, Completer>{};

  GoogleAuthClient get authClient {
    if (accessToken == null) {
      throw Exception('No access token provided');
    }
    return GoogleAuthClient(accessToken!);
  }

  DriveApi getDrive([http.Client? client]) => DriveApi(client ?? authClient);

  @override
  Future<ClipboardItem> download(
    ClipboardItem item, {
    void Function(int, int)? onProgress,
  }) async {
    if (item.driveFileId == null || item.rootDir == null) return item;

    final client = authClient;

    final completer = Completer();
    _downloadOperations[item.id] = completer;
    completer.future.then((value) => client.close());

    if (onProgress != null) {
      client
          .setProgressListener()
          .listen((value) => onProgress(value.$1, value.$2));
    }

    try {
      final drive = getDrive(client);
      final Media media = await drive.files.get(
        item.driveFileId!,
        downloadOptions: DownloadOptions.fullMedia,
      ) as Media;

      final rootDir = await getPersistedRootDirPath(item.rootDir!);
      final ext =
          item.fileExtension ?? ".${mime.extensionFromMime(media.contentType)}";
      final fileName = "${getId()}_${item.fileName}$ext";
      final filePath = p.join(rootDir, fileName);

      final file = io.File(filePath).openWrite();

      await file.addStream(media.stream);
      return item.copyWith(localPath: filePath)..applyId(item);
    } catch (e) {
      logger.e(e, error: e);
      return item;
    } finally {
      client.close();
      _downloadOperations.remove(item.id);
    }
  }

  @override
  Future<ClipboardItem> upload(
    ClipboardItem item, {
    void Function(int, int)? onProgress,
  }) async {
    final client = authClient;

    final completer = Completer();
    _uploadOperations[item.id] = completer;
    completer.future.then((value) => client.close());

    try {
      final io.File file = io.File(item.localPath!);
      final length = await file.length();

      if (onProgress != null) {
        client
            .setProgressListener(contentLength: length)
            .listen((value) => onProgress(value.$1, value.$2));
      }

      final drive = getDrive(client);

      final gfile = File()
        ..name = p.basename(file.path)
        ..mimeType = item.fileMimeType
        ..originalFilename = item.fileName
        ..parents = ["appDataFolder"];

      final media = Media(
        file.openRead(),
        length,
        contentType: item.fileMimeType ?? 'application/octet-stream',
      );
      final result = await drive.files.create(
        gfile,
        uploadMedia: media,
        uploadOptions: ResumableUploadOptions(
          chunkSize: length < $10MB ? $5MB : $20MB,
        ),
      );

      item = item.copyWith(
        driveFileId: result.id,
      )..applyId(item);
      logger.i("File uploaded successfully!");
      return item;
    } catch (e) {
      logger.e(e, error: e);
      return item;
    } finally {
      client.close();
      _uploadOperations.remove(item.id);
    }
  }

  @override
  String? accessToken;

  @override
  Future<void> delete(ClipboardItem item) async {
    final client = authClient;
    try {
      final drive = getDrive();
      if (item.driveFileId == null) return;
      await drive.files.delete(item.driveFileId!);
    } catch (e) {
      logger.e(e, error: e);
    } finally {
      client.close();
    }
  }

  @override
  void cancelOperation(ClipboardItem item) {
    _uploadOperations[item.id]?.complete();
    _downloadOperations[item.id]?.complete();
    _uploadOperations.remove(item.id);
    _downloadOperations.remove(item.id);
  }

  @override
  bool isDownloading(ClipboardItem item) {
    return _downloadOperations.containsKey(item.id);
  }
}
