import 'dart:async';

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/network_status.dart';
import 'package:clipboard/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkObserver extends StatefulWidget {
  final Widget child;
  const NetworkObserver({
    super.key,
    required this.child,
  });

  @override
  State<NetworkObserver> createState() => _NetworkObserverState();
}

class _NetworkObserverState extends State<NetworkObserver> {
  late StreamSubscription subscription;
  bool wasDisconnected = false;
  late AuthCubit authCubit;
  late MonetizationCubit monetizationCubit;
  late DriveSetupCubit driveSetupCubit;
  late AppConfigCubit appConfigCubit;

  @override
  void initState() {
    super.initState();
    networkObserver.listen(onConnectionChanged);
    authCubit = BlocProvider.of<AuthCubit>(context);
    monetizationCubit = BlocProvider.of<MonetizationCubit>(context);
    driveSetupCubit = BlocProvider.of<DriveSetupCubit>(context);
    appConfigCubit = BlocProvider.of<AppConfigCubit>(context);
  }

  Future<void> refetchStates() async {
    final userId = authCubit.userId;
    if (userId == null) return;
    await Future.wait([
      monetizationCubit.login(userId),
      driveSetupCubit.fetch(),
      appConfigCubit.syncClocks(),
    ]);
  }

  void onConnectionChanged(bool isConnected) {
    if (isConnected) {
      if (wasDisconnected) {
        wasDisconnected = false;
        refetchStates();
        showTextSnackbar(
          context.locale.internetConnected,
          success: true,
          closePrevious: true,
        );
      }
    } else {
      wasDisconnected = true;
      showTextSnackbar(
        context.locale.internetDisconnected,
        failure: true,
        closePrevious: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
