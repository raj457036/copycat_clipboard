import 'dart:convert';

import 'package:clipboard/base/data/services/supabase_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  final refreshUrl = Uri.parse(
    'https://example.supabase.co/auth/v1/token?grant_type=refresh_token',
  );

  SupabaseHttpClient clientReturning(int status, String body) =>
      SupabaseHttpClient(MockClient((_) async => http.Response(body, status)));

  test('non-JSON 4xx on refresh becomes retryable 503', () async {
    final client = clientReturning(403, '<html>Captive portal</html>');
    final response = await client.post(refreshUrl);
    expect(response.statusCode, 503);
    expect(response.body, '<html>Captive portal</html>');
  });

  test('empty redirect on refresh becomes retryable 503', () async {
    final client = clientReturning(302, '');
    expect((await client.post(refreshUrl)).statusCode, 503);
  });

  test('rate limiting on refresh becomes retryable 503', () async {
    final client = clientReturning(
      429,
      jsonEncode({'code': 'over_request_rate_limit', 'msg': 'slow down'}),
    );
    expect((await client.post(refreshUrl)).statusCode, 503);
  });

  test('genuine auth error on refresh is passed through', () async {
    final body = jsonEncode({
      'code': 'refresh_token_not_found',
      'msg': 'Invalid Refresh Token',
    });
    final response = await clientReturning(400, body).post(refreshUrl);
    expect(response.statusCode, 400);
    expect(response.body, body);
  });

  test('non-refresh requests are untouched', () async {
    final client = clientReturning(403, '<html></html>');
    final other = Uri.parse(
      'https://example.supabase.co/auth/v1/token?grant_type=password',
    );
    expect((await client.post(other)).statusCode, 403);
  });
}
