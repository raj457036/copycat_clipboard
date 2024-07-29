// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/pages/login/widgets/login_form.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/attention_button.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> showIntoDialog() async {
    if (!isDesktopPlatform) return;
    final context = rootNavKey.currentContext;
    if (context != null) {
      const AttentionDialog().show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isMobile = Breakpoints.isMobile(mq.size.width) ||
        mq.orientation == Orientation.portrait;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        switch (state) {
          case AuthenticatedAuthState():
            Future.delayed(
              const Duration(seconds: 2),
              showIntoDialog,
            );
            break;
          case UnauthenticatedAuthState(:final failure):
            if (failure != null) {
              showFailureSnackbar(failure);
            }
            break;
          default:
        }
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            final bg = ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: isMobile ? Alignment.topCenter : Alignment.center,
                  end:
                      isMobile ? Alignment.bottomCenter : Alignment.centerRight,
                  colors: const [Colors.black, Colors.transparent],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                AssetConstants.catInValley,
                fit: BoxFit.cover,
                height: height,
                width: width,
              ),
            );
            if (!isMobile) {
              final child = Row(
                children: [
                  Expanded(
                    flex: isMobile ? 2 : 1,
                    child: bg,
                  ),
                  Expanded(flex: isMobile ? 4 : 1, child: const LoginForm()),
                ],
              );

              return child;
            }

            return Stack(
              children: [
                Positioned(
                  height: 250,
                  child: bg,
                ),
                const LoginForm(),
              ],
            );
          },
        ),
      ),
    );
  }
}
