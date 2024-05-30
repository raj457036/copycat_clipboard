// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/constants/strings/asset_constants.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/pages/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            break;
          default:
        }
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            final child = Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  flex: isMobile ? 2 : 1,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin:
                            isMobile ? Alignment.topCenter : Alignment.center,
                        end: isMobile
                            ? Alignment.bottomCenter
                            : Alignment.centerRight,
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
                  ),
                ),
                Expanded(flex: isMobile ? 4 : 1, child: const LoginForm()),
              ],
            );

            return child;
          },
        ),
      ),
    );
  }
}
