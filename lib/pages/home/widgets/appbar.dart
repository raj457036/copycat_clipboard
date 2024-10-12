import 'package:clipboard/pages/home/widgets/search_bar.dart';
import 'package:copycat_base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  void clearSelection(BuildContext context) {
    context.read<SelectedClipsCubit>().clear();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.mq.size;
    if (size.shortestSide < 250) return const SizedBox.shrink();
    return BlocSelector<SelectedClipsCubit, SelectedClipsState, int>(
      selector: (state) {
        switch (state) {
          case ClipSelected(:final selectedClipIds):
            return selectedClipIds.length;
          case _:
            return 0;
        }
      },
      builder: (context, count) {
        if (count > 0) {
          return AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => clearSelection(context),
            ),
            centerTitle: false,
            title: Text("$count"),
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            titleSpacing: 0,
            titleTextStyle: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_rounded),
              ),
              width12,
            ],
          );
        }
        return AppBar(
          title: const SearchInputBar(),
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          titleTextStyle: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          actions: const [
            // ActivePlanAction(),
            // width12,
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
