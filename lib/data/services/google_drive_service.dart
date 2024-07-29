import 'dart:async';
import 'dart:io' as io;

import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/numbers/file_sizes.dart';
import 'package:copycat_base/data/services/google_services.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/oauth2/v2.dart' as oauth2;
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import 'package:path/path.dart' as p;

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
    StreamSubscription? subscription;

    final completer = Completer();
    _downloadOperations[item.id] = completer;
    completer.future.then((value) => client.close());

    if (onProgress != null) {
      subscription = client
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
      subscription?.cancel();
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
    StreamSubscription? subscription;
    try {
      final io.File file = io.File(item.localPath!);
      final length = await file.length();

      if (onProgress != null) {
        subscription = client
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
          chunkSize: length < $10MB ? $2MB : $10MB,
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
      subscription?.cancel();
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
