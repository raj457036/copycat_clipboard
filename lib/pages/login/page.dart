// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as su_auth;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        switch (state) {
          case AuthenticatedAuthState() || OfflineAuthState():
            await context.read<AppConfigCubit>().load();
            context.read<ClipboardCubit>().fetch();
            context.read<ClipCollectionCubit>().fetch();
            context.read<SyncManagerCubit>().syncChanges();
            context.read<OfflinePersistanceCubit>().startListners();
            context.read<DriveSetupCubit>().fetch();
            context.goNamed(RouteConstants.home);
            break;
          default:
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(padding16),
            child: SizedBox.square(
              dimension: 400,
              child: su_auth.SupaEmailAuth(
                onSignUpComplete: (su_auth.AuthResponse response) {
                  if (response.session != null && response.user != null) {
                    context
                        .read<AuthCubit>()
                        .authenticated(response.session!, response.user!);
                  }
                },
                onSignInComplete: (su_auth.AuthResponse response) {
                  if (response.session != null && response.user != null) {
                    context
                        .read<AuthCubit>()
                        .authenticated(response.session!, response.user!);
                  }
                },
                onError: (error) {
                  context.read<AuthCubit>().unauthenticated(
                        Failure.fromException(error),
                      );

                  if (error is su_auth.AuthException) {
                    showTextSnackbar(error.message);
                  }
                },
                metadataFields: [
                  su_auth.MetaDataField(
                    label: "Full Name",
                    key: "display_name",
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    validator: ValidationBuilder().minLength(1).build(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
