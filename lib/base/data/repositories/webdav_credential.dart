import 'dart:async';
import 'dart:convert';

import 'package:clipboard/base/constants/strings/strings.dart';
import 'package:clipboard/base/domain/model/webdav_config/webdav_config.dart';
import 'package:clipboard/base/domain/repositories/webdav_credential.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:dartz/dartz.dart';
import 'package:clipboard/common/secure_store.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_io/io.dart';

@LazySingleton(as: WebDavCredentialRepository)
class WebDavCredentialRepositoryImpl implements WebDavCredentialRepository {
  static const String _storageKey = 'copycat.webdav_config';
  static const _logger = AppLogger.scoped('WebDavCredentialRepo');

  final SecureStore _secureStorage = const SecureStore();
  final SupabaseClient _supabase;

  WebDavCredentialRepositoryImpl(this._supabase);

  HttpClient _createHttpClient(WebDavConfig config) {
    final client = HttpClient();
    client.idleTimeout = const Duration(seconds: 15);
    client.connectionTimeout = const Duration(seconds: 15);
    if (config.allowSelfSignedCert) {
      client.badCertificateCallback = (cert, host, port) => true;
    }
    return client;
  }

  @override
  FailureOr<WebDavConfig?> getConfig() async {
    try {
      final raw = await _secureStorage.read(key: _storageKey);
      if (raw != null && raw.isNotEmpty) {
        final json = jsonDecode(raw) as Map<String, dynamic>;
        return Right(WebDavConfig.fromJson(json));
      }

      // Check if user has WebDAV metadata saved on their Supabase account
      final userMeta = _supabase.auth.currentUser?.userMetadata?['webdav'];
      if (userMeta is Map) {
        final serverUrl = userMeta['serverUrl'] as String? ?? '';
        final username = userMeta['username'] as String? ?? '';
        final basePath =
            userMeta['basePath'] as String? ?? defaultWebDavBasePath;
        final allowSelfSigned =
            userMeta['allowSelfSignedCert'] as bool? ?? false;
        final autoClean =
            userMeta['autoCleanInactiveFiles'] as bool? ?? false;
        if (serverUrl.isNotEmpty) {
          return Right(
            WebDavConfig(
              serverUrl: serverUrl,
              username: username,
              password: '', // Blank on new device until user enters password
              basePath: basePath,
              allowSelfSignedCert: allowSelfSigned,
              autoCleanInactiveFiles: autoClean,
            ),
          );
        }
      }

      return const Right(null);
    } catch (e) {
      _logger.e('Failed to read WebDAV config: $e');
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> saveConfig(WebDavConfig config) async {
    try {
      final raw = jsonEncode(config.toJson());
      await _secureStorage.write(key: _storageKey, value: raw);

      // Sync non-sensitive server metadata to Supabase user account
      try {
        if (_supabase.auth.currentUser != null) {
          final currentMetadata =
              _supabase.auth.currentUser?.userMetadata ?? {};
          await _supabase.auth.updateUser(
            UserAttributes(
              data: {
                ...currentMetadata,
                'webdav': {
                  'serverUrl': config.serverUrl,
                  'username': config.username,
                  'basePath': config.basePath,
                  'allowSelfSignedCert': config.allowSelfSignedCert,
                  'autoCleanInactiveFiles': config.autoCleanInactiveFiles,
                },
              },
            ),
          );
        }
      } catch (e) {
        _logger.w('Failed to sync WebDAV user metadata: $e');
      }

      return const Right(null);
    } catch (e) {
      _logger.e('Failed to save WebDAV config: $e');
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> deleteConfig() async {
    try {
      await _secureStorage.delete(key: _storageKey);
      return const Right(null);
    } catch (e) {
      _logger.e('Failed to delete WebDAV config: $e');
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<void> testConnection(WebDavConfig config) async {
    HttpClient? client;
    try {
      final uri = Uri.parse(config.serverUrl.trim());
      if (!uri.hasScheme || !uri.hasAuthority) {
        return const Left(
          Failure(
            message: 'Invalid WebDAV Server URL format.',
            code: 'invalid-url',
          ),
        );
      }

      client = _createHttpClient(config);
      final req = await client.openUrl('PROPFIND', uri);
      final authHeader =
          'Basic ${base64Encode(utf8.encode('${config.username}:${config.password}'))}';
      req.headers.set(HttpHeaders.authorizationHeader, authHeader);
      req.headers.set('Depth', '0');

      final resp = await req.close().timeout(const Duration(seconds: 15));
      await resp.drain();

      final statusCode = resp.statusCode;
      if ((statusCode >= 200 && statusCode < 300) || statusCode == 207) {
        return const Right(null);
      } else if (statusCode == 401 || statusCode == 403) {
        return const Left(
          Failure(
            message:
                'Authentication failed. Please check your username and password.',
            code: 'webdav-auth-failed',
          ),
        );
      } else if (statusCode == 404) {
        return const Left(
          Failure(
            message: 'Server URL path not found (404).',
            code: 'webdav-not-found',
          ),
        );
      } else {
        return Left(
          Failure(
            message: 'WebDAV server returned status code $statusCode.',
            code: 'webdav-status-$statusCode',
          ),
        );
      }
    } on TimeoutException {
      return const Left(
        Failure(
          message:
              'Connection timed out. Please check if the server URL and port are reachable.',
          code: 'webdav-timeout',
        ),
      );
    } on HandshakeException catch (e) {
      final msg = config.allowSelfSignedCert
          ? 'SSL/TLS handshake failed: ${e.message}'
          : 'SSL/TLS certificate error. If using a self-signed certificate, please enable it in Advanced settings.';
      return Left(
        Failure(
          message: msg,
          code: 'webdav-ssl-error',
        ),
      );
    } on SocketException catch (e) {
      if (e.message.toLowerCase().contains('failed host lookup') ||
          e.osError?.errorCode == 8) {
        return const Left(
          Failure(
            message:
                'Server not found. Please check your domain name or host URL.',
            code: 'webdav-host-not-found',
          ),
        );
      } else if (e.message.toLowerCase().contains('connection refused') ||
          e.osError?.errorCode == 61 ||
          e.osError?.errorCode == 111) {
        return const Left(
          Failure(
            message:
                'Connection refused. Please check the port and ensure WebDAV is running.',
            code: 'webdav-connection-refused',
          ),
        );
      }
      return Left(
        Failure(
          message: 'Could not connect to WebDAV server: ${e.message}',
          code: 'webdav-socket-error',
        ),
      );
    } on HttpException catch (e) {
      return Left(
        Failure(
          message: 'HTTP error: ${e.message}',
          code: 'webdav-http-error',
        ),
      );
    } catch (e) {
      _logger.e('WebDAV test connection error: $e');
      return Left(Failure.fromException(e));
    } finally {
      client?.close(force: true);
    }
  }
}
