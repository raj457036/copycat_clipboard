import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
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
          onPressed: () async {
            context.read<WindowActionCubit>().togglePinned();
          },
          iconSize: 16,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(),
          ),
          color: pinned ? colors.error : null,
          icon: const Icon(Icons.vertical_align_top),
          tooltip: context.locale.pinToTop,
        );
      },
    );
  }
}
