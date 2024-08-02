import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
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

  Future<void> openTutorialPage() async {
    await launchUrlString(tutorialsUrl);
  }

  Future<void> openYoutubeTutorials() async {
    await launchUrlString(youtubePlaylistUrl);
  }

  Future<void> openSupport() async {
    await launchUrlString(supportUrl);
  }

  Future<void> openDiscord() async {
    await launchUrlString(discordUrl);
  }

  Future<void> openGoogleGroup() async {
    await launchUrlString(googleGroupUrl);
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
                    child: ListView(
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
                          isThreeLine: true,
                          subtitle: Text(
                            context.locale.feature1Desc,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.history_rounded),
                          title: Text(context.locale.feature2),
                          isThreeLine: true,
                          subtitle: Text(
                            context.locale.feature2Desc,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.paste_rounded),
                          title: Text(context.locale.feature3),
                          isThreeLine: true,
                          subtitle: Text(
                            context.locale.feature3Desc,
                          ),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.collections_bookmark_rounded),
                          title: Text(context.locale.feature4),
                          isThreeLine: true,
                          subtitle: Text(
                            context.locale.feature4Desc,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isVisible) const VerticalDivider(),
                Expanded(
                  child: ListView(
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
                        onTap: openTutorialPage,
                        isThreeLine: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: radius12),
                      ),
                      ListTile(
                        leading: const Icon(Icons.video_collection_rounded),
                        title: Text(context.locale.tutorials),
                        subtitle: Text(
                          context.locale.tutorialsDesc,
                        ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        isThreeLine: true,
                        onTap: openYoutubeTutorials,
                        shape: const RoundedRectangleBorder(
                            borderRadius: radius12),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.feedback),
                        title: Text(context.locale.shareYourFeedback),
                        subtitle: Text(context.locale.shareYourFeedbackDesc),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: openSupport,
                        shape: const RoundedRectangleBorder(
                            borderRadius: radius12),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.discord),
                        title: Text(context.locale.joinDiscord),
                        subtitle: Text(context.locale.joinDiscordDesc),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: openDiscord,
                        shape: const RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.group),
                        title: Text(context.locale.joinGoogleGroup),
                        subtitle: Text(
                          context.locale.joinGoogleGroupDesc,
                        ),
                        isThreeLine: true,
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: openGoogleGroup,
                        shape: const RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ],
                  ),
                )
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
