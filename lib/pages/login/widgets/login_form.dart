import 'package:clipboard/pages/login/widgets/local_signin_button.dart';
import 'package:clipboard/widgets/locale_dropdown_button.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/strings/asset_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/domain/model/localization.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_pro/widgets/forms/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  Future<void> launchPrivacyPolicyPage() async {
    await launchUrl(
      Uri.parse(
        const String.fromEnvironment("PRIVACY_POLICY_URL"),
      ),
    );
  }

  Future<void> launchTermsOfServicePage() async {
    await launchUrl(
      Uri.parse(
        const String.fromEnvironment("TERMS_CONDITIONS_URL"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final mq = context.mq;
    final isMobile = Breakpoints.isMobile(mq.size.width);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!isMobile)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage(AssetConstants.catPeekUpSideDownImage),
              height: 140,
            ),
          ),
        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: padding16,
              right: padding16,
              top: 180,
            ),
            child: SizedBox(
              // height: mq.size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  Text(
                    context.locale.copyCatClipboard,
                    style: textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  height12,
                  Text(
                    context.locale.oneClipboardLimitlessPosibility,
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  height24,
                  const LocalSigninButton(),
                  height10,
                  Text(
                    "· · ─────── ·𖥸· ─────── · ·",
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  height10,
                  SizedBox(
                    width: 350,
                    // height: 390,
                    child: CopyCatClipboardLoginForm(
                      onSignUpComplete: (user, accessToken) {
                        final cubit = context.read<AuthCubit>();
                        cubit.authenticated(user, accessToken);

                        cubit.analyticsRepo.logSignup(
                          signUpMethod: "Email",
                          parameters: {
                            "userId": user.userId,
                            "email": user.email,
                          },
                        );
                      },
                      onSignInComplete: (user, accessToken) {
                        final cubit = context.read<AuthCubit>();
                        cubit.authenticated(user, accessToken);
                        cubit.analyticsRepo.logSignin(
                          loginMethod: "Email",
                          parameters: {
                            "userId": user.userId,
                            "email": user.email,
                          },
                        );
                      },
                      onError: (error) {
                        final cubit = context.read<AuthCubit>();
                        final failure = Failure.fromException(error);
                        cubit.unauthenticated(failure);
                        showFailureSnackbar(failure);
                      },
                      localization: AuthUserFormLocalization(
                        displayNameLabel: context.locale.fullName,
                        enterEmail: context.locale.enterEmail,
                        validEmailError: context.locale.validEmailError,
                        enterPassword: context.locale.enterPassword,
                        passwordLengthError: context.locale.passwordLengthError,
                        signIn: context.locale.signIn,
                        signUp: context.locale.signUp,
                        forgotPassword: context.locale.forgotPassword,
                        dontHaveAccount: context.locale.dontHaveAccount,
                        haveAccount: context.locale.haveAccount,
                        sendPasswordReset: context.locale.sendPasswordReset,
                        passwordResetSent: context.locale.passwordResetSent,
                        backToSignIn: context.locale.backToSignIn,
                        unexpectedError: context.locale.unexpectedError,
                      ),
                    ),
                  ),

                  // const Spacer(),
                  const LocaleDropdownButton(),
                  height10,
                  Text.rich(
                    TextSpan(text: context.locale.termsAgreeP1, children: [
                      TextSpan(
                        text: context.locale.privacyPolicies,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = launchPrivacyPolicyPage,
                      ),
                      TextSpan(
                        text: context.locale.and,
                      ),
                      TextSpan(
                        text: context.locale.termsOfService,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = launchTermsOfServicePage,
                      ),
                      TextSpan(
                        text: context.locale.termsAgreeP2,
                      )
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  // height12,
                  if (isMobile)
                    const Image(
                      image: AssetImage(AssetConstants.catPeekUpSideDownImage),
                      height: 50,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
