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
    return ListTile(
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
  }
}
