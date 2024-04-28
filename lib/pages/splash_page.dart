// ignore_for_file: use_build_context_synchronously

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Durations.long1,
      context.read<AuthCubit>().checkForAuthentication,
    );
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
          case UnauthenticatedAuthState():
            context.goNamed(RouteConstants.login);
            context.read<OfflinePersistanceCubit>().stopListners();
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
