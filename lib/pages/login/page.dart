import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/google_token_cubit/google_token_manager_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as su_auth;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state) {
          case AuthenticatedAuthState() || OfflineAuthState():
            context.read<ClipboardCubit>().fetch();
            context.read<SyncManagerCubit>().syncChanges();
            context.read<GoogleTokenManagerCubit>().load();
            context.goNamed(RouteConstants.home);
            break;
          default:
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(padding16),
            child: su_auth.SupaSocialsAuth(
              socialProviders: const [
                su_auth.OAuthProvider.apple,
                su_auth.OAuthProvider.google,
              ],
              scopes: {
                su_auth.OAuthProvider.google: [
                  DriveApi.driveFileScope,
                  DriveApi.driveAppdataScope,
                ].join(",")
              },
              colored: true,
              queryParams: const {
                su_auth.OAuthProvider.google: {
                  "prompt": "consent",
                  "access_type": "offline",
                }
              },
              redirectUrl: 'clipboard://login-callback/',
              onSuccess: (su_auth.Session response) {
                context.read<AuthCubit>().authenticated(response);

                if (response.user.appMetadata["provider"] == "google" &&
                    response.providerToken != null) {
                  context.read<GoogleTokenManagerCubit>().save(
                        accessToken: response.providerToken ?? '',
                        refreshToken: response.providerRefreshToken,
                        expiry: DateTime.now().add(const Duration(minutes: 55)),
                      );
                }
              },
              onError: (error) {
                context.read<AuthCubit>().unauthenticated(
                      Failure.fromException(error),
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
