import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/constants/strings/route_constants.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EventBridge extends StatelessWidget {
  final Widget child;

  const EventBridge({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case AuthenticatedAuthState() || OfflineAuthState():
                context.read<ClipboardCubit>().fetch();
                context.read<SyncManagerCubit>().syncChanges();
                context.goNamed(RouteConstants.home);
                break;
              case UnauthenticatedAuthState():
                context.goNamed(RouteConstants.login);
              default:
            }
          },
        ),
        BlocListener<SyncManagerCubit, SyncManagerState>(
          listener: (context, state) {
            if (state is SyncedState) {
              context.read<ClipboardCubit>().fetch(fromTop: true);
            }
          },
        ),
        BlocListener<OfflinePersistanceCubit, OfflinePersistanceState>(
          listener: (context, state) {
            switch (state) {
              case OfflinePersistanceCreating():
                context.showTextSnackbar("Inserting Clip...");
                break;
              case OfflinePersistanceUpdating():
                context.showTextSnackbar("Updating Clip...");
                break;
              case OfflinePersistanceSaved(:final item, :final created):
                context.read<ClipboardCubit>().put(item, isNew: created);
                break;
              case OfflinePersistanceError(:final failure):
                context.showFailureSnackbar(failure);
                break;
              case _:
            }
          },
        ),
      ],
      child: Container(),
    );
  }
}
