// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/db/subscription/subscription.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as su;
import 'package:window_manager/window_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });

  Future<void> checkForAuth(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();
    authCubit.checkForAuthentication();
    await Future.delayed(const Duration(seconds: 2));

    if (authCubit.subscription != null) {
      if (!context.mounted) return;
      await authDone(context, authCubit.subscription!, authCubit.session!.user);
    }
  }

  Future<void> authDone(
      BuildContext context, Subscription subscription, su.User user) async {
    await context.read<AppConfigCubit>().load(subscription);
    context.read<MonetizationCubit>().login(user.id);
    context.read<ClipCollectionCubit>().fetch();
    context.read<SyncManagerCubit>().syncChanges();
    context.read<OfflinePersistanceCubit>().startListners();
    context.read<DriveSetupCubit>().fetch();
    context.goNamed(RouteConstants.home);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => checkForAuth(context));
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        switch (state) {
          case AuthenticatedAuthState(:final subscription, :final user):
            authDone(context, subscription, user);

            break;
          case UnauthenticatedAuthState():
            context.goNamed(RouteConstants.login);
            context.read<OfflinePersistanceCubit>().stopListners();
            if (isDesktopPlatform) {
              await windowManager.show();
            }
          default:
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
