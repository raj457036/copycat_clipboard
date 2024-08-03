import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/domain/model/localization.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_pro/widgets/forms/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              return state.accessToken;
            }
            return null;
          },
          builder: (context, accessToken) {
            if (accessToken == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              width: 300,
              height: 300,
              child: ResetPasswordForm(
                localization: AuthUserResetPasswordFormLocalization(
                  passwordResetSent: context.locale.passwordResetSuccess,
                  enterPassword: context.locale.enterPassword,
                  passwordLengthError: context.locale.passwordLengthError,
                  updatePassword: context.locale.updatePassword,
                  unexpectedError: context.locale.unexpectedError,
                ),
                accessToken: accessToken,
                onSuccess: (user) {
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
