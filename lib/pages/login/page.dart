// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/pages/login/widgets/login_form.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/attention_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          case AuthenticatedAuthState() || OfflineAuthState():
            await context.read<AppConfigCubit>().load();
            context.read<ClipCollectionCubit>().fetch();
            context.read<SyncManagerCubit>().syncChanges();
            context.read<OfflinePersistanceCubit>().startListners();
            context.read<DriveSetupCubit>().fetch();
            context.goNamed(RouteConstants.home);

            Future.delayed(
              const Duration(seconds: 2),
              showIntoDialog,
            );
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
