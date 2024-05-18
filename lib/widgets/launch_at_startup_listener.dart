import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:launch_at_startup/launch_at_startup.dart';

class LaunchAtStartUpListener extends StatelessWidget {
  final Widget child;

  const LaunchAtStartUpListener({
    super.key,
    required this.child,
  });

  Future<void> setLaunchAtStartup(bool launch) async {
    if (launch) {
      await launchAtStartup.enable();
    } else {
      await launchAtStartup.disable();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile) return child;
    return BlocListener<AppConfigCubit, AppConfigState>(
      listenWhen: (previous, current) =>
          previous.config.launchAtStartup != current.config.launchAtStartup,
      listener: (context, state) async {
        await setLaunchAtStartup(state.config.launchAtStartup);
      },
      child: child,
    );
  }
}
