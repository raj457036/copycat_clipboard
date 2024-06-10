import 'dart:convert';

import 'package:clipboard/common/failure.dart';
import 'package:clipboard/model/drive_access_token.dart';
import 'package:dartz/dartz.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class DriveCredentialRepository {
  FailureOr<DriveAccessToken> getDriveCredentials();
  FailureOr<DriveAccessToken> setupDrive(String authCode);
  FailureOr<DriveAccessToken> refreshAccessToken();
  FailureOr<void> launchConsentPage();
}

@LazySingleton(as: DriveCredentialRepository)
class DriveCredentialRepositoryImpl implements DriveCredentialRepository {
  final SupabaseClient client;
  final String table = "drive_credentials";

  DriveCredentialRepositoryImpl(this.client);

  PostgrestClient get db => client.rest;

  @override
  FailureOr<void> launchConsentPage() async {
    const String clientId =
        "892296995692-qh4gj970dkvf4m3aur0ol0an2l70lvsj.apps.googleusercontent.com";
    const String redirectUrl = 'https://connect.entilitystudio.com';

    final url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUrl,
      'scope': [
        DriveApi.driveAppdataScope,
      ].join(" "),
      "access_type": "offline",
      "prompt": "consent",
    });

    try {
      await launchUrl(url);
      return const Right(null);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<DriveAccessToken> getDriveCredentials() async {
    try {
      final userId = client.auth.currentSession?.user.id;

      if (userId == null) {
        return const Left(authFailure);
      }

      final query = db
          .from(table)
          .select([
            "access_token",
            "issued_at",
            "expires_in",
            "scopes",
          ].join(","))
          .eq("userId", userId);
      final doc = await query.single();
      return Right(DriveAccessToken.fromJson(doc));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<DriveAccessToken> setupDrive(String authCode) async {
    try {
      final result = await client.functions.invoke(
        "get_gaccess_token",
        body: {"code": authCode},
        method: HttpMethod.post,
      );
      return Right(DriveAccessToken.fromJson(jsonDecode(result.data)));
    } catch (e) {
      return const Left(
        Failure(
          message: "Failed to connect, please try again later!",
          code: "gcode-issue",
        ),
      );
    }
  }

  @override
  FailureOr<DriveAccessToken> refreshAccessToken() async {
    try {
      final result = await client.functions.invoke(
        "get_gaccess_token",
        method: HttpMethod.get,
      );
      return Right(DriveAccessToken.fromJson(jsonDecode(result.data)));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
