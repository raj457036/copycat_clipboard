import 'package:clipboard/widgets/clip_item/clip_create_time.dart';
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadingClipboardOption extends StatelessWidget {
  final ClipboardItem item;
  final DateTime created;
  final bool hovered;
  final EdgeInsets? createdPadding;
  final EdgeInsets? padding;
  final bool selected;
  final AppLayout layout;

  const LeadingClipboardOption({
    super.key,
    required this.item,
    this.hovered = false,
    this.createdPadding,
    this.padding,
    this.selected = false,
    required this.layout,
    required this.created,
  });

  void toggleSelect(BuildContext context) {
    final cubit = context.read<SelectedClipsCubit>();
    if (selected) {
      cubit.unselect(item);
      return;
    }
    cubit.select(item);
  }

  @override
  Widget build(BuildContext context) {
    final isGrid = layout == AppLayout.grid;
    final iconSize = isGrid ? 24.0 : 18.0;
    if (hovered || selected) {
      return SizedBox.square(
        dimension: iconSize * 1.44,
        child: Focus(
          canRequestFocus: false,
          descendantsAreTraversable: false,
          child: IconButton(
            isSelected: selected,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            iconSize: iconSize,
            tooltip: "Select",
            onPressed: () => toggleSelect(context),
            selectedIcon: const Icon(Icons.check_circle_rounded),
            icon: const Icon(Icons.circle_outlined),
          ),
        ),
      );
    }
    return ClipCreateTime(created: created, padding: createdPadding);
  }
}
