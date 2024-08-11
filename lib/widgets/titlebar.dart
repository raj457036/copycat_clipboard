import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/compact_mode_toggle.dart';
import 'package:clipboard/widgets/pin_to_top_toggle.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      context.locale.appName,
      style: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TitlebarView extends StatelessWidget {
  final Widget child;
  const TitlebarView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobilePlatform) return child;

    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
          ),
          child: const SizedBox(
            height: 26,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(width: 85),
                CompactModeToggleButton(),
                PinToTopToggleButton(),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
