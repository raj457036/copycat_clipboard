import 'package:clipboard/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinToTopToggleButton extends StatelessWidget {
  const PinToTopToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<WindowActionCubit, WindowActionState, (bool, bool)>(
      selector: (state) {
        return (state.pinned, state.loading);
      },
      builder: (context, state) {
        final (pinned, loading) = state;
        if (loading) return const SizedBox.shrink();
        return IconButton(
          onPressed: () {
            context.read<WindowActionCubit>().togglePinned();
          },
          icon: Icon(
            Icons.vertical_align_top,
            color: pinned ? colors.primary : null,
          ),
          tooltip: "Pin to top",
        );
      },
    );
  }
}
