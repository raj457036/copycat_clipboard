import 'dart:ui' as ui;

import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateInitializer extends StatefulWidget {
  final Widget child;
  const StateInitializer({
    super.key,
    required this.child,
  });

  @override
  State<StateInitializer> createState() => _StateInitializerState();
}

class _StateInitializerState extends State<StateInitializer>
    with WidgetsBindingObserver {
  ui.FlutterView? _view;

  Future<void> setupWindow() async {
    final appConfigCubit = context.read<AppConfigCubit>();
    final windowCubit = context.read<WindowActionCubit>();
    await Future.delayed(Durations.extralong4);
    final appConfig = appConfigCubit.state.config;
    windowCubit.setup(appConfig.view, appConfig.windowSize);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setupWindow();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _view = View.maybeOf(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _view = null;
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final ui.Display? display = _view?.display;
    if (display == null) {
      return;
    }
    if (display.size.width / display.devicePixelRatio < Breakpoints.xs) {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
