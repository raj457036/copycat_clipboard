import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinToTopButton extends StatelessWidget {
  const PinToTopButton({
    super.key,
  });

  void toggle(BuildContext context) {
    final appConfigCubit = context.read<AppConfigCubit>();
    appConfigCubit.togglePinned();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<AppConfigCubit, AppConfigState, bool>(
      selector: (state) {
        return state.config.pinned;
      },
      builder: (context, pinned) {
        return IconButton(
          onPressed: () => toggle(context),
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(),
          ),
          color: pinned ? colors.primary : colors.outlineVariant,
          iconSize: 20,
          icon: const Icon(Icons.push_pin_rounded),
          tooltip: pinned ? "Unpin" : "Pin",
        );
      },
    );
  }
}
