import 'dart:async';

import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/snackbar.dart';
import 'package:copycat_pro/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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
  StreamSubscription? subscription;
  bool wasDisconnected = false;
  late AuthCubit authCubit;
  late MonetizationCubit monetizationCubit;
  late DriveSetupCubit driveSetupCubit;
  late AppConfigCubit appConfigCubit;

  Stream<bool>? networkObserver;

  bool transformNetworkStatus(InternetStatus event) {
    return event == InternetStatus.connected;
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    if (authCubit.isLocalAuth) return;
    networkObserver =
        InternetConnection().onStatusChange.map(transformNetworkStatus);
    subscription = networkObserver?.listen(onConnectionChanged);
    monetizationCubit = BlocProvider.of<MonetizationCubit>(context);
    driveSetupCubit = BlocProvider.of<DriveSetupCubit>(context);
    appConfigCubit = BlocProvider.of<AppConfigCubit>(context);
    appConfigCubit.syncClocks();
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
    if (authCubit.isLocalAuth) return;
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
