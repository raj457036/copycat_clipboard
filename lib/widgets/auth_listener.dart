import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

class AuthListener extends StatelessWidget {
  final Widget child;

  const AuthListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        switch (state) {
          case UnknownAuthState() ||
                AuthenticatingAuthState() ||
                UnauthenticatedAuthState():
            logger.i("Auth State Unknown or Authenticating or Unauthenticated");
            rootNavKey.currentContext?.goNamed(RouteConstants.login);
            closeSnackbar();
            if (isDesktopPlatform) {
              windowManager.show();
            }
            break;
          case LocalAuthenticatedAuthState():
            {
              rootNavKey.currentContext?.goNamed(RouteConstants.home);
              await Future.wait([
                context.read<AppConfigCubit>().load(),
                context.read<ClipCollectionCubit>().fetch(),
                context.read<OfflinePersistanceCubit>().startListners(),
              ]);
            }

          case AuthenticatedAuthState(:final user):
            {
              rootNavKey.currentContext?.goNamed(RouteConstants.home);
              await Future.wait([
                context.read<AppConfigCubit>().load(),
                context.read<MonetizationCubit>().login(user.userId),
                context.read<ClipCollectionCubit>().fetch(),
                context.read<SyncManagerCubit>().syncChanges(),
                context.read<OfflinePersistanceCubit>().startListners(),
                context.read<DriveSetupCubit>().fetch(),
              ]);
            }

            logger.i("Auth State Authenticated");
            break;
        }
      },
      child: child,
    );
  }
}
