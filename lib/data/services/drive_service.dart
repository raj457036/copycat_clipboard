import 'dart:io' as io;

import 'package:googleapis/drive/v3.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

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

  Future<DriveFile> upload(io.File file);
}

class GoogleAuthClient with http.BaseClient {
  final String accessToken;

  GoogleAuthClient(this.accessToken);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers["Authorization"] = "Bearer $accessToken";
    final client = http.Client();
    try {
      return client.send(request);
    } finally {
      client.close();
    }
  }
}

@Named("google_drive")
@LazySingleton(as: DriveService)
class GoogleDriveService implements DriveService {
  http.Client get authClient {
    if (accessToken == null) {
      throw Exception('No access token provided');
    }
    return GoogleAuthClient(accessToken!);
  }

  DriveApi get drive => DriveApi(authClient);

  @override
  Future<DriveFile> upload(io.File file) async {
    final name = p.basename(file.path);
    final gfile = File()
      ..name = name
      ..parents = ["appDataFolder"]
      ..capabilities = FileCapabilities(
        canDownload: true,
      );
    final length = await file.length();
    final media = Media(
      file.openRead(),
      length,
    );
    final result = await drive.files.create(gfile, uploadMedia: media);
    return DriveFile(
      id: result.id!,
      name: name,
      size: length,
    );
  }

  @override
  String? accessToken;
}
