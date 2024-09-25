import 'package:clipboard/widgets/compact_mode_toggle.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_base/widgets/drag_to_move_area_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      context.locale.appName,
      style: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TitlebarView extends StatelessWidget {
  final Widget child;
  const TitlebarView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return child;

    final colors = context.colors;

    return BlocSelector<WindowActionCubit, WindowActionState, AppView>(
      selector: (state) {
        return state.view;
      },
      builder: (context, view) {
        final dragToMove = DragToMoveArea2(
          enabled: view == AppView.windowed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.surface,
            ),
            child: SizedBox(
              height: 26,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(width: 85),
                  const CompactModeToggleButton(),
                  if (Platform.isWindows)
                    WindowCaptionButton.close(
                      brightness: colors.brightness,
                      onPressed: context.windowAction?.hide,
                    ),
                ],
              ),
            ),
          ),
        );
        if (view == AppView.topDocked) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [Expanded(child: child), dragToMove],
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [dragToMove, Expanded(child: child)],
        );
      },
    );
  }
}
