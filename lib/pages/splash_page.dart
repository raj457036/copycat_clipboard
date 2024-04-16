import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/google_token_cubit/google_token_manager_cubit.dart';
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
      listener: (context, state) {
        switch (state) {
          case AuthenticatedAuthState() || OfflineAuthState():
            context.read<ClipboardCubit>().fetch();
            context.read<SyncManagerCubit>().syncChanges();
            context.read<GoogleTokenManagerCubit>().load();
            context.read<OfflinePersistanceCubit>().startListners();
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
