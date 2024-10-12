import 'package:clipboard/widgets/clip_item/clip_create_time.dart';
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadingClipboardOption extends StatelessWidget {
  final int clipId;
  final DateTime created;
  final bool hovered;
  final EdgeInsets? createdPadding;
  final EdgeInsets? padding;
  final bool selected;

  const LeadingClipboardOption({
    super.key,
    required this.clipId,
    this.hovered = false,
    this.createdPadding,
    this.padding,
    this.selected = false,
    required this.created,
  });

  void toggleSelect(BuildContext context) {
    final cubit = context.read<SelectedClipsCubit>();
    if (selected) {
      cubit.unselect(clipId);
      return;
    }
    cubit.select(clipId);
  }

  @override
  Widget build(BuildContext context) {
    if (hovered || selected) {
      return Padding(
        padding: padding ?? const EdgeInsets.only(left: padding4),
        child: SizedBox.square(
          dimension: 32,
          child: Focus(
            canRequestFocus: false,
            descendantsAreTraversable: false,
            child: IconButton(
              isSelected: selected,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              tooltip: "Select",
              onPressed: () => toggleSelect(context),
              selectedIcon: const Icon(Icons.check_circle_rounded),
              icon: const Icon(Icons.circle_outlined),
            ),
          ),
        ),
      );
    }
    return ClipCreateTime(created: created, padding: createdPadding);
  }
}
