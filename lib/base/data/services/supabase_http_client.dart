import 'dart:convert';

import 'package:clipboard/common/logging.dart';
import 'package:http/http.dart' as http;

/// HTTP client used by Supabase that protects the session from transient
/// token-refresh failures.
///
/// gotrue signs the user out on *any* non-5xx refresh error. Non-JSON 3xx/4xx
/// responses (captive portals, VPN/proxy reconnects after wake or unlock,
/// CDN error pages) and rate limiting are not session problems, so they are
/// rewritten to `503` which gotrue treats as retryable. Genuine auth errors
/// (a JSON body carrying an error code, e.g. `refresh_token_not_found`) are
/// passed through unchanged.
class SupabaseHttpClient extends http.BaseClient {
  SupabaseHttpClient([http.Client? inner]) : _inner = inner ?? http.Client();

  final http.Client _inner;

  static const _transientStatusCodes = {408, 425, 429};
  static const _transientErrorCodes = {'over_request_rate_limit'};
  static const _logThrottle = Duration(minutes: 1);

  String? _lastLogKey;
  DateTime? _lastLogAt;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _inner.send(request);
    final status = response.statusCode;

    if (!_isRefreshTokenRequest(request.url) ||
        (status >= 200 && status < 300)) {
      return response;
    }

    if (status >= 500) {
      _log(status, null, transient: true);
      return response;
    }

    final bytes = await response.stream.toBytes();
    final errorCode = _authErrorCode(bytes);
    final transient =
        errorCode == null ||
        _transientStatusCodes.contains(status) ||
        _transientErrorCodes.contains(errorCode);

    _log(status, errorCode, transient: transient);

    return http.StreamedResponse(
      Stream.value(bytes),
      transient ? 503 : status,
      contentLength: bytes.length,
      request: response.request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: transient ? 'Service Unavailable' : response.reasonPhrase,
    );
  }

  bool _isRefreshTokenRequest(Uri url) =>
      url.path.endsWith('/auth/v1/token') &&
      url.queryParameters['grant_type'] == 'refresh_token';

  String? _authErrorCode(List<int> bytes) {
    try {
      final data = jsonDecode(utf8.decode(bytes));
      if (data is! Map) return null;
      for (final key in const ['error_code', 'code', 'error']) {
        final value = data[key];
        if (value is String && value.isNotEmpty) return value;
      }
    } catch (_) {}
    return null;
  }

  void _log(int status, String? errorCode, {required bool transient}) {
    final key = '$status:$errorCode:$transient';
    final now = DateTime.now();
    if (key == _lastLogKey &&
        _lastLogAt != null &&
        now.difference(_lastLogAt!) < _logThrottle) {
      return;
    }
    _lastLogKey = key;
    _lastLogAt = now;

    final message =
        'Auth token refresh failed: status=$status, '
        'code=${errorCode ?? 'none'}';
    if (transient) {
      logger.w('$message (treated as transient, will retry)');
    } else {
      logger.e('$message (session rejected by server)');
    }
  }

  @override
  void close() => _inner.close();
}
