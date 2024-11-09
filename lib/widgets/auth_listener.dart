import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_pro/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            await context.windowAction?.show();
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
                // context.read<SyncManagerCubit>().syncChanges(),
                context.read<OfflinePersistanceCubit>().startListners(),
                context.read<DriveSetupCubit>().fetch(),
              ]);
            }

            logger.i("Auth State Authenticated");
        }
      },
      child: child,
    );
  }
}
