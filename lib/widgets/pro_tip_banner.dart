import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ProTipTile extends StatelessWidget {
  final String tip;
  const ProTipTile({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final tile = ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: radius12,
      ),
      leading: const Icon(
        Icons.lightbulb,
        color: Colors.amber,
      ),
      title: Text(context.locale.proTip),
      subtitle: Text(tip),
      tileColor: colors.secondaryContainer,
    );
    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.only(
          right: padding8,
          left: padding8,
          bottom: padding8,
        ),
        child: tile,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: padding12,
        top: padding12,
      ),
      child: tile,
    );
  }
}
