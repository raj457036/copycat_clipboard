import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as su_auth;

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
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
        if (isMobile)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AssetConstants.catPeekImage,
              height: 55,
            ),
          ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "CopyCat Clipboard",
                    style: textTheme.headlineMedium,
                  ),
                  height12,
                  Text(
                    "One Clipboard, Limitless Productivity",
                    style: textTheme.titleMedium,
                  ),
                  height24,
                  SizedBox(
                    width: 350,
                    height: 320,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
