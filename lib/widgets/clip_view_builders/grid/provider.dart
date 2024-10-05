import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ClipGridViewBuilder = Widget Function(
  BuildContext context,
  SliverGridDelegate delegate,
  Axis scrollDirection,
);

class ClipGridDelegateProvider extends StatelessWidget {
  final ClipGridViewBuilder builder;

  const ClipGridDelegateProvider({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowActionCubit, WindowActionState>(
      builder: (context, state) {
        final SliverGridDelegate gridDelegate;
        final Axis scrollDirection;
        switch (state.view) {
          case AppView.bottomDocked || AppView.topDocked:
            gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            );
            scrollDirection = Axis.horizontal;
          case AppView.windowed:
          case AppView.leftDocked || AppView.rightDocked:
          default:
            gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            );
            scrollDirection = Axis.vertical;
        }
        return builder(context, gridDelegate, scrollDirection);
      },
    );
  }
}
