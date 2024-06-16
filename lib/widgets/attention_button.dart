import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AttentionDialog extends StatelessWidget {
  const AttentionDialog({super.key});

  Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  Future<void> openHowToUse() async {
    await launchUrlString(
      "https://www.entilitystudio.com/copycat-clipboard/tutorials",
    );
  }

  Future<void> openTutorials() async {
    await launchUrlString(
      "https://youtube.com/playlist?list=PL_ka68u9FZVcNmCcyvTzI_-iOHevRHsCa&si=CH0Jh50WJKOkUU6n",
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Dialog(
      insetPadding: const EdgeInsets.all(padding14),
      child: LayoutBuilder(builder: (context, constraints) {
        final isVisible =
            constraints.maxWidth >= 800 && constraints.maxHeight >= 550;
        return Padding(
          padding: const EdgeInsets.all(padding20),
          child: SizedBox(
            width: 800,
            height: 550,
            child: Row(
              children: [
                if (isVisible)
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          context.locale.whatsNew,
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium,
                        ),
                        height8,
                        ListTile(
                          leading: const Icon(Icons.important_devices_rounded),
                          title: Text(context.locale.feature1),
                          subtitle: Text(
                            context.locale.feature1Desc,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.history_rounded),
                          title: Text(context.locale.feature2),
                          subtitle: Text(
                            context.locale.feature2Desc,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.paste_rounded),
                          title: Text(context.locale.feature3),
                          subtitle: Text(
                            context.locale.feature3Desc,
                          ),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.collections_bookmark_rounded),
                          title: Text(context.locale.feature4),
                          subtitle: Text(
                            context.locale.feature4Desc,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isVisible) const VerticalDivider(),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      context.locale.gettingStarted,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium,
                    ),
                    height8,
                    ListTile(
                      leading: const Icon(Icons.help_outline_rounded),
                      title: Text(context.locale.howToUse),
                      subtitle: Text(context.locale.howToUseDesc),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: openHowToUse,
                      shape:
                          const RoundedRectangleBorder(borderRadius: radius12),
                    ),
                    ListTile(
                      leading: const Icon(Icons.video_collection_rounded),
                      title: Text(context.locale.tutorials),
                      subtitle: Text(
                        context.locale.tutorialsDesc,
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: openTutorials,
                      shape:
                          const RoundedRectangleBorder(borderRadius: radius12),
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AttentionButton extends StatelessWidget {
  const AttentionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton.filled(
          onPressed: () {
            const AttentionDialog().show(context);
          },
          tooltip: context.locale.learnAboutFeatures,
          padding: const EdgeInsets.all(padding10),
          icon: const Icon(Icons.diversity_2_rounded),
        ),
        Positioned(
          bottom: -13,
          left: -10,
          right: -10,
          child: Chip(
            shape: const RoundedRectangleBorder(
              borderRadius: radius12,
              side: BorderSide(color: Colors.transparent),
            ),
            label: Text(context.locale.learn),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: padding10),
            backgroundColor: colors.tertiaryContainer,
            labelStyle: textTheme.bodySmall?.copyWith(
              color: colors.onTertiaryContainer,
            ),
            labelPadding: const EdgeInsets.fromLTRB(2, -6, 2, -6),
          ),
        ),
      ],
    );
  }
}
