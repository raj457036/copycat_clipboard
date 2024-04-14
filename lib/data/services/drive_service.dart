import 'dart:async';
import 'dart:io' as io;

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

class DriveFile {
  final String id;
  final int size;
  final String name;

  DriveFile({
    required this.id,
    required this.size,
    required this.name,
  });
}

abstract class DriveService {
  String? accessToken;

  Future<ClipboardItem> upload(ClipboardItem item);
  Future<ClipboardItem> download(ClipboardItem item);
  Future<void> delete(ClipboardItem item);
}

class GoogleAuthClient with http.BaseClient {
  final String accessToken;
  BehaviorSubject<(int, int)>? progress;
  int contentLength = 0;

  GoogleAuthClient(this.accessToken);

  BehaviorSubject<(int, int)> setProgressListener({int? contentLength}) {
    progress ??= BehaviorSubject<(int, int)>();
    this.contentLength = contentLength ?? 0;
    return progress!;
  }

  void unsetProgressListener() {
    progress?.close();
    contentLength = 0;
    progress = null;
  }

  @override
  void close() {
    unsetProgressListener();
    super.close();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers["Authorization"] = "Bearer $accessToken";
    final client = http.Client();
    StreamSubscription<List<int>>? subscription;
    try {
      int currentBytes = 0;
      final response = await client.send(request);
      final totalBytes =
          int.tryParse(response.headers['content-length'] ?? '-') ??
              contentLength;
      subscription = response.stream.listen(
        (List<int> chunk) {
          currentBytes += chunk.length;
          progress?.add((currentBytes, totalBytes));

          logger.info(
            'Uploaded: $currentBytes / $totalBytes bytes',
          );
        },
        cancelOnError: true,
      );
      return response;
    } finally {
      subscription?.cancel();
      client.close();
    }
  }
}

@Named("google_drive")
@LazySingleton(as: DriveService)
class GoogleDriveService implements DriveService {
  GoogleAuthClient get authClient {
    if (accessToken == null) {
      throw Exception('No access token provided');
    }
    return GoogleAuthClient(accessToken!);
  }

  DriveApi getDrive([http.Client? client]) => DriveApi(client ?? authClient);

  @override
  Future<ClipboardItem> download(ClipboardItem item) async {
    if (item.driveFileId == null || item.rootDir == null) return item;

    final client = authClient;

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
    } finally {
      client.close();
    }
  }

  @override
  Future<ClipboardItem> upload(ClipboardItem item) async {
    final client = authClient;
    try {
      final io.File file = io.File(item.localPath!);
      final length = await file.length();

      client.setProgressListener(contentLength: length);

      final drive = getDrive(client);
      final gfile = File()
        ..name = p.basename(file.path)
        ..mimeType = item.fileMimeType
        ..originalFilename = item.fileName
        ..parents = ["appDataFolder"];

      final media = Media(
        file.openRead(),
        length,
      );
      final result = await drive.files.create(gfile, uploadMedia: media);
      item = item.copyWith(
        driveFileId: result.id,
      )..applyId(item);
      logger.info("File uploaded successfully!");
    } finally {
      client.close();
    }
    return item;
  }

  @override
  String? accessToken;

  @override
  Future<void> delete(ClipboardItem item) async {
    final drive = getDrive();
    if (item.driveFileId == null) return;
    await drive.files.delete(item.driveFileId!);
  }
}
