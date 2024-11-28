import 'package:animate_do/animate_do.dart';
import 'package:clipboard/pages/onboard/widgets/locale_and_logout.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class WelcomeStep extends StatelessWidget {
  final VoidCallback onContinue;

  const WelcomeStep({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: FadeIn(
        delay: Durations.short2,
        child: Material(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Text(
                  "Welcome to",
                  style: textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                height10,
                Text(
                  "CopyCat Clipboard",
                  style: textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                height20,
                IconButton.filled(
                  onPressed: onContinue,
                  icon: Icon(Icons.chevron_right),
                ),
                height10,
                Text(
                  "Let's Continue",
                  style: textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                LocaleAndLogoutRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
