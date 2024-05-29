import 'dart:async';

import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    networkObserver.listen(onConnectionChanged);
  }

  void refetchStates() {
    context.read<AuthCubit>().fetchSubscription();
  }

  void onConnectionChanged(bool isConnected) {
    if (isConnected) {
      if (wasDisconnected) {
        wasDisconnected = false;
        refetchStates();
        showTextSnackbar(
          "Internet Connected",
          success: true,
          closePrevious: true,
        );
      }
    } else {
      wasDisconnected = true;
      showTextSnackbar(
        "Internet Disconnected",
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
