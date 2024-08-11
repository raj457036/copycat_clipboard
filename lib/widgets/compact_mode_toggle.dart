import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompactModeToggleButton extends StatelessWidget {
  const CompactModeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<WindowActionCubit, WindowActionState, (bool, bool)>(
      selector: (state) {
        return (state.compact, state.loading);
      },
      builder: (context, state) {
        final (compact, loading) = state;
        if (loading) return const SizedBox.shrink();
        return IconButton(
          onPressed: () {
            context.read<WindowActionCubit>().toggleCompact();
          },
          iconSize: 16,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            shape: const RoundedRectangleBorder(),
          ),
          color: compact ? colors.error : null,
          icon: const Icon(Icons.view_compact),
          tooltip: context.locale.compactMode,
        );
      },
    );
  }
}
