import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'dart:io' as io;

import 'package:clipboard/common/logging.dart';
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

  Future<ClipboardItem> upload(ClipboardItem item);
  Future<ClipboardItem> download(ClipboardItem item);
  Future<void> delete(ClipboardItem item);
}

class GoogleAuthClient with http.BaseClient {
  final String accessToken;
  BehaviorSubject<(int, int)>? progress;
  int? contentLength;

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
    super.close();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers["Authorization"] = "Bearer $accessToken";
    final client = http.Client();
    try {
      int currentBytes = 0;
      final response = await client.send(request);
      final totalBytes = contentLength ??
          int.tryParse(response.headers['content-length'] ?? '-') ??
          1;

      final stream = response.stream.map((chunk) {
        currentBytes += chunk.length;
        progress?.add((currentBytes, totalBytes));

        logger.info(
          'Uploaded: $currentBytes / $totalBytes bytes',
        );
        return chunk;
      });
      final newResponse = http.StreamedResponse(
        stream,
        response.statusCode,
        contentLength: response.contentLength,
        request: response.request,
        headers: response.headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        reasonPhrase: response.reasonPhrase,
      );

      return newResponse;
    } finally {
      client.close();
    }
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

  Future<void> connect() async {
// Construct an Uri to Google's oauth2 endpoint
    final url2 = Uri.https('www.googleapis.com', 'oauth2/v4/token');

// Use this code to get an access token
    final response = await http.post(url2, body: {
      'client_id':
          "892296995692-18bkkorqb2g2suf8sb1l45s71gutto59.apps.googleusercontent.com",
      'client_secret': "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",
      'redirect_uri': 'https://clipboard-419514.web.app',
      'grant_type': 'authorization_code',
      'code': "code",
    });

// Get the access token from the response
    print(jsonDecode(response.body));
    /**
     * EXAMPLE
     * {
     * access_token: ya29.a0Ad52N39hDea9LWlWvKrDmckhah7v99Fb_dRH9aC5_eVeGOFNQaw5E5c9MEy3iGbm_AnPa7fFvxHa3XYVk1gd7tQIYgoaYebuEA4G5q2OTPwumjWPGEpsUCsD2vrTmYY45CrULF6d887-kn51ogPfQccPKoFPb4CwKf2raCgYKARsSARESFQHGX2MiVOKLLrUk0uPHZKX8KEffOw0171, 
     * expires_in: 3599, 
     * refresh_token: 1//0g1sr9BvaLN1tCgYIARAAGBASNwF-L9Ir6EqfF0lF4lDWPTNn_LNvv0UE4PRwpahu7qicpoyCcrEtxM5alNIF-9bHNGSOjRAG2FY, 
     * scope: https://www.googleapis.com/auth/drive.appdata https://www.googleapis.com/auth/drive.file, 
     * token_type: Bearer
     * }
     */
  }
}
