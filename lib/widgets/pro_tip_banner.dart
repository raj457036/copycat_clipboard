import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class TipTile extends StatelessWidget {
  final String? title;
  final String tip;
  const TipTile({super.key, this.title, required this.tip});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = context.mq.size.width;
    if (width < 300) return const SizedBox.shrink();
    final isMobile = Breakpoints.isMobile(width);
    final tile = ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: radius12,
      ),
      leading: const Icon(
        Icons.lightbulb,
        color: Colors.amber,
      ),
      title: Text(title ?? context.locale.proTip),
      subtitle: Text(tip),
      tileColor: colors.secondaryContainer,
    );
    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.all(padding8),
        child: tile,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: padding12,
        top: padding12,
        bottom: padding10,
      ),
      child: tile,
    );
  }
}
