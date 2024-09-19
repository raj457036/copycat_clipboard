import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/common/dock_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompactModeToggleButton extends StatelessWidget {
  const CompactModeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowActionCubit, WindowActionState>(
      builder: (context, state) {
        if (state.loading) return const SizedBox.shrink();

        return MenuAnchor(
          consumeOutsideTap: true,
          builder: (
            BuildContext context,
            MenuController controller,
            Widget? child,
          ) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              iconSize: 20,
              icon: const Icon(Icons.window_rounded),
              tooltip: 'Change Layout',
            );
          },

          // tooltip: "Change Layout",
          menuChildren: [
            MenuItemButton(
              leadingIcon: const Icon(
                Icons.flip_to_front_rounded,
                size: 26,
              ),
              child: const Text("Window"),
              onPressed: () =>
                  context.read<WindowActionCubit>().setWindowdView(),
            ),
            MenuItemButton(
              leadingIcon: const Icon(DockIcons.dockRight),
              child: const Text("Dock Right"),
              onPressed: () => context
                  .read<WindowActionCubit>()
                  .setDockedView(AppView.rightDocked),
            ),
            MenuItemButton(
              leadingIcon: const Icon(DockIcons.dockBottom),
              child: const Text("Dock Bottom"),
              onPressed: () => context
                  .read<WindowActionCubit>()
                  .setDockedView(AppView.bottomDocked),
            ),
            MenuItemButton(
              leadingIcon: const Icon(DockIcons.dockLeft),
              child: const Text("Dock Left"),
              onPressed: () => context
                  .read<WindowActionCubit>()
                  .setDockedView(AppView.leftDocked),
            ),
            MenuItemButton(
              leadingIcon: const Icon(DockIcons.dockTop),
              child: const Text("Dock Top"),
              onPressed: () => context
                  .read<WindowActionCubit>()
                  .setDockedView(AppView.topDocked),
            ),
          ],
        );
      },
    );
  }
}
