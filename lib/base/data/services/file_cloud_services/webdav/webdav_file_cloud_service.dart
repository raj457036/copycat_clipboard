import 'dart:async';
import 'dart:convert';

import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/model/cloud_file_id/cloud_file_id.dart';
import 'package:clipboard/base/domain/model/webdav_config/webdav_config.dart';
import 'package:clipboard/base/domain/repositories/webdav_credential.dart';
import 'package:clipboard/base/domain/services/file_cloud_service.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/blur_hash.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

@Named("webdav")
@LazySingleton(as: FileCloudService)
class WebDavFileCloudService implements FileCloudService {
  static const _logger = AppLogger.scoped('WebDavFileCloudService');

  final WebDavCredentialRepository _credentialRepo;
  final AppConfigCubit _appConfig;

  WebDavFileCloudService(
    this._credentialRepo,
    this._appConfig,
  );

  @override
  Future<bool> get isAvailable async {
    final result = await _credentialRepo.getConfig();
    return result.fold((l) => false, (config) => config != null);
  }

  HttpClient _createHttpClient(WebDavConfig config) {
    final client = HttpClient();
    client.idleTimeout = const Duration(seconds: 15);
    client.connectionTimeout = const Duration(seconds: 15);
    if (config.allowSelfSignedCert) {
      client.badCertificateCallback = (cert, host, port) => true;
    }
    return client;
  }

  Uri _buildUri(String serverUrl, String relativePath) {
    final cleanServer = serverUrl.trim().endsWith('/')
        ? serverUrl.trim().substring(0, serverUrl.trim().length - 1)
        : serverUrl.trim();
    final cleanPath =
        relativePath.startsWith('/') ? relativePath : '/$relativePath';
    return Uri.parse('$cleanServer$cleanPath');
  }

  String _getAuthHeader(WebDavConfig config) {
    return 'Basic ${base64Encode(utf8.encode('${config.username}:${config.password}'))}';
  }

  Failure _handleWebDavException(dynamic e, WebDavConfig config) {
    if (e is TimeoutException) {
      return const Failure(
        message: 'WebDAV connection timed out.',
        code: 'webdav-timeout',
      );
    } else if (e is HandshakeException) {
      final msg = config.allowSelfSignedCert
          ? 'SSL/TLS handshake failed: ${e.message}'
          : 'SSL/TLS certificate error. If using a self-signed certificate, please enable it in Advanced settings.';
      return Failure(message: msg, code: 'webdav-ssl-error');
    } else if (e is SocketException) {
      if (e.message.toLowerCase().contains('failed host lookup') ||
          e.osError?.errorCode == 8) {
        return const Failure(
          message:
              'Server not found. Please check your WebDAV domain name or host URL.',
          code: 'webdav-host-not-found',
        );
      } else if (e.message.toLowerCase().contains('connection refused') ||
          e.osError?.errorCode == 61 ||
          e.osError?.errorCode == 111) {
        return const Failure(
          message:
              'Connection refused. Please check the port and ensure WebDAV is running.',
          code: 'webdav-connection-refused',
        );
      }
      return Failure(
        message: 'Could not connect to WebDAV server: ${e.message}',
        code: 'webdav-socket-error',
      );
    }
    return Failure.fromException(e);
  }

  Future<void> _ensureDirectoryExists(
    HttpClient client,
    WebDavConfig config,
    String dirPath,
  ) async {
    final segments = dirPath.split('/').where((s) => s.isNotEmpty).toList();
    String currentPath = '';

    for (final segment in segments) {
      currentPath += '/$segment';
      try {
        final uri = _buildUri(config.serverUrl, currentPath);
        final req = await client.openUrl('MKCOL', uri);
        req.headers.set(
          HttpHeaders.authorizationHeader,
          _getAuthHeader(config),
        );
        final resp = await req.close().timeout(const Duration(seconds: 10));
        await resp.drain();
        _logger.d(
          () => 'Directory $currentPath MKCOL status: ${resp.statusCode}',
        );
      } catch (e) {
        _logger.d(() => 'Directory check/create notice for $currentPath: $e');
      }
    }
  }

  Future<String?> _getBlurHashIfNeeded(ClipboardItem item) async {
    if (!item.isImage || item.localPath == null) {
      return null;
    }

    if (item.imgBlurHash != null) return item.imgBlurHash;

    return await getBlurHash(item.localPath!);
  }

  @override
  FailureOr<ClipboardItem> upload(
    ClipboardItem item, {
    Stream<TransferProgress>? progress,
  }) async {
    if (!_appConfig.isFileSyncEnabled) {
      return const Left(
        Failure(
          message: "File and Media Sync is not enabled",
          code: "file-sync-not-enabled",
        ),
      );
    }

    if (!_appConfig.canUploadFile(item.fileSize ?? 0)) {
      return const Left(
        Failure(
          message: "Auto upload is disabled for files over the limit.",
          code: "auto-upload-restriction",
        ),
      );
    }

    final configResult = await _credentialRepo.getConfig();
    final config = configResult.fold((l) => null, (r) => r);

    if (config == null) {
      return const Left(
        Failure(
          message: "WebDAV storage is not configured",
          code: "webdav-not-configured",
        ),
      );
    }

    if (item.localPath == null) {
      return const Left(
        Failure(
          message: "No local file path to upload",
          code: "missing-local-path",
        ),
      );
    }

    final localFile = File(item.localPath!);
    if (!await localFile.exists()) {
      return const Left(
        Failure(
          message: "Local file does not exist",
          code: "file-not-found",
        ),
      );
    }

    HttpClient? client;
    try {
      client = _createHttpClient(config);
      await _ensureDirectoryExists(client, config, config.sanitizedBasePath);

      final fileLength = await localFile.length();
      final fileExt = item.fileExtension ??
          (item.fileName != null ? p.extension(item.fileName!) : '');
      final sanitizedName =
          p.basenameWithoutExtension(item.fileName ?? 'file');
      final uniqueFileName = '${getId()}_$sanitizedName$fileExt';
      final relativePath = '${config.sanitizedBasePath}/$uniqueFileName';

      final fileUri = _buildUri(config.serverUrl, relativePath);
      final req = await client.openUrl('PUT', fileUri);
      req.headers.set(
        HttpHeaders.authorizationHeader,
        _getAuthHeader(config),
      );
      if (item.fileMimeType != null) {
        req.headers.set(
          HttpHeaders.contentTypeHeader,
          item.fileMimeType!,
        );
      }
      req.contentLength = fileLength;

      // Stream the raw binary bytes directly to the WebDAV server
      await req.addStream(localFile.openRead());
      final resp = await req.close();
      await resp.drain();

      final statusCode = resp.statusCode;

      if (statusCode >= 200 && statusCode < 300) {
        final blurHash = await _getBlurHashIfNeeded(item);
        final cloudFileId = CloudFileId.webdav(relativePath);

        final updated = item.copyWith(
          driveFileId: cloudFileId.format(),
          imgBlurHash: blurHash ?? item.imgBlurHash,
        );

        _logger.i('WebDAV upload success: $relativePath');
        return Right(updated);
      } else {
        _logger.e('WebDAV upload failed with status $statusCode');
        return Left(
          Failure(
            message: "WebDAV upload failed with status code $statusCode",
            code: "webdav-upload-failure-$statusCode",
          ),
        );
      }
    } catch (e) {
      _logger.e('WebDAV upload exception: $e');
      return Left(_handleWebDavException(e, config));
    } finally {
      client?.close(force: true);
    }
  }

  @override
  FailureOr<ClipboardItem> download(
    ClipboardItem item, {
    Stream<TransferProgress>? progress,
  }) async {
    if (item.driveFileId == null) {
      return const Left(
        Failure(
          message: "No drive file ID to download",
          code: "missing-drive-file-id",
        ),
      );
    }

    final configResult = await _credentialRepo.getConfig();
    final config = configResult.fold((l) => null, (r) => r);

    if (config == null) {
      return const Left(
        Failure(
          message: "WebDAV storage is not configured",
          code: "webdav-not-configured",
        ),
      );
    }

    HttpClient? client;
    try {
      final cloudFileId = CloudFileId.parse(item.driveFileId!);
      final fileUri = _buildUri(config.serverUrl, cloudFileId.pathOrId);

      client = _createHttpClient(config);
      final req = await client.getUrl(fileUri);
      req.headers.set(
        HttpHeaders.authorizationHeader,
        _getAuthHeader(config),
      );

      final resp = await req.close();
      final statusCode = resp.statusCode;

      if (statusCode >= 200 && statusCode < 300) {
        final rootDir = await getPersistedRootDirPath(item.rootDir);
        final fileName = '${getId()}_${resolveFileName(
          item.fileName ?? 'file',
          extension: item.fileExtension,
          mimeType: item.fileMimeType,
        )}';
        final localFilePath = p.join(rootDir, fileName);

        final targetFile = File(localFilePath);
        await targetFile.parent.create(recursive: true);

        IOSink? sink;
        try {
          sink = targetFile.openWrite();
          await resp.pipe(sink);
        } catch (e) {
          await sink?.close();
          if (await targetFile.exists()) {
            await targetFile.delete();
          }
          rethrow;
        }

        _logger.i('WebDAV download success: $localFilePath');
        return Right(item.copyWith(localPath: localFilePath));
      } else if (statusCode == 404) {
        await resp.drain();
        _logger.w('WebDAV file not found (404)');
        return const Left(
          Failure(
            message:
                "File does not exist on the currently connected WebDAV server.",
            code: "webdav-file-not-found",
          ),
        );
      } else {
        await resp.drain();
        _logger.e('WebDAV download failed with status $statusCode');
        return Left(
          Failure(
            message: "WebDAV download failed with status code $statusCode",
            code: "webdav-download-failure-$statusCode",
          ),
        );
      }
    } catch (e) {
      _logger.e('WebDAV download exception: $e');
      return Left(_handleWebDavException(e, config));
    } finally {
      client?.close(force: true);
    }
  }

  @override
  FailureOr<ClipboardItem> delete(ClipboardItem item) async {
    if (item.driveFileId == null) {
      return Right(item);
    }

    final configResult = await _credentialRepo.getConfig();
    final config = configResult.fold((l) => null, (r) => r);

    if (config == null) {
      return const Left(
        Failure(
          message: "WebDAV storage is not configured",
          code: "webdav-not-configured",
        ),
      );
    }

    HttpClient? client;
    try {
      final cloudFileId = CloudFileId.parse(item.driveFileId!);
      final fileUri = _buildUri(config.serverUrl, cloudFileId.pathOrId);

      client = _createHttpClient(config);
      final req = await client.openUrl('DELETE', fileUri);
      req.headers.set(
        HttpHeaders.authorizationHeader,
        _getAuthHeader(config),
      );

      final resp = await req.close().timeout(const Duration(seconds: 30));
      await resp.drain();
      final statusCode = resp.statusCode;

      if ((statusCode >= 200 && statusCode < 300) || statusCode == 404) {
        _logger.i('WebDAV delete success: ${cloudFileId.pathOrId}');
        return Right(item);
      } else {
        _logger.e('WebDAV delete failed with status $statusCode');
        return Left(
          Failure(
            message: "Failed to delete file from WebDAV: HTTP $statusCode",
            code: "webdav-delete-failure",
          ),
        );
      }
    } catch (e) {
      _logger.e('WebDAV delete exception: $e');
      return Left(_handleWebDavException(e, config));
    } finally {
      client?.close(force: true);
    }
  }
}
