import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as su_auth;

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.resetYourPassword),
      ),
      body: Center(
        child: BlocSelector<AuthCubit, AuthState, String?>(
          selector: (state) {
            if (state is AuthenticatedAuthState) {
              return state.session.accessToken;
            }
            return null;
          },
          builder: (context, state) {
            if (state == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              width: 300,
              height: 300,
              child: su_auth.SupaResetPassword(
                accessToken: state,
                localization: su_auth.SupaResetPasswordLocalization(
                  passwordResetSent: context.locale.passwordResetSuccess,
                  enterPassword: context.locale.enterPassword,
                  passwordLengthError: context.locale.passwordLengthError,
                  updatePassword: context.locale.updatePassword,
                  unexpectedError: context.locale.unexpectedError,
                ),
                onSuccess: (su_auth.UserResponse response) {
                  context.pop();
                },
                onError: (error) {
                  showTextSnackbar(error.toString(), failure: true);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
