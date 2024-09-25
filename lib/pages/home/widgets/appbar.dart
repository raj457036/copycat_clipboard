import 'package:clipboard/pages/home/widgets/search_bar.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.mq.size;
    if (size.shortestSide < 250) return const SizedBox.shrink();
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
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
