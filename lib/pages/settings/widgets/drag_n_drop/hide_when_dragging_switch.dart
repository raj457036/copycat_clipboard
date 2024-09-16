import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HideWhenDraggingSwitchTile extends StatelessWidget {
  const HideWhenDraggingSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppConfigCubit, AppConfigState, (bool, bool)>(
      selector: (state) {
        switch (state) {
          case AppConfigLoaded(:final config):
            return (config.enableDragNDrop, config.hideWhenDragging);
          default:
            return (false, false);
        }
      },
      builder: (context, enabled) {
        final (dragNDrop, hideWhenDragging) = enabled;
        return SwitchListTile(
          value: hideWhenDragging,
          onChanged: dragNDrop
              ? context.read<AppConfigCubit>().toggleHideWhenDragging
              : null,
          title: const Text("Auto Hide On Drag"),
          subtitle: const Text("Hide the window when dragging items out."),
        );
      },
    );
  }
}
