import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/pages/login/widgets/local_signin_button.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/locale_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as su_auth;
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
    final mq = MediaQuery.of(context);
    final isMobile = Breakpoints.isMobile(mq.size.width);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!isMobile)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AssetConstants.catPeekUpSideDownImage,
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
                  SizedBox(
                    width: 350,
                    // height: 390,
                    child: su_auth.SupaEmailAuth(
                      onSignUpComplete: (su_auth.AuthResponse response) {
                        if (response.session != null && response.user != null) {
                          final cubit = context.read<AuthCubit>();
                          cubit.authenticated(
                            response.session!,
                            response.user!,
                          );
                          if (isAnalyticsSupported) {
                            analytics.logSignUp(
                              signUpMethod: "Email",
                              parameters: {
                                "userId": response.user!.id,
                                "email": response.user!.email!,
                              },
                            );
                          }
                        }
                      },
                      onSignInComplete: (su_auth.AuthResponse response) {
                        if (response.session != null && response.user != null) {
                          final cubit = context.read<AuthCubit>();
                          cubit.authenticated(
                            response.session!,
                            response.user!,
                          );
                          if (isAnalyticsSupported) {
                            analytics.logLogin(
                              loginMethod: "Email",
                              parameters: {
                                "userId": response.user!.id,
                                "email": response.user!.email!,
                              },
                            );
                          }
                        }
                      },
                      onError: (error) {
                        final cubit = context.read<AuthCubit>();
                        cubit.unauthenticated(
                          Failure.fromException(error),
                        );

                        if (error is su_auth.AuthException) {
                          showTextSnackbar(error.message);
                        }
                      },
                      metadataFields: [
                        su_auth.MetaDataField(
                          label: context.locale.fullName,
                          key: "display_name",
                          prefixIcon: const Icon(Icons.person_outline_rounded),
                          validator: ValidationBuilder().minLength(1).build(),
                        ),
                      ],
                      localization: su_auth.SupaEmailAuthLocalization(
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
                  const LocalSigninButton(),
                  // const Spacer(),
                  const LocaleDropdown(),
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
                    Image.asset(
                      AssetConstants.catPeekUpSideDownImage,
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
