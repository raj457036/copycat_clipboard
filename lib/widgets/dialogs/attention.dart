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

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    final whatsNew = ListView(
      children: [
        Text(
          context.locale.whatsNew,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        height8,
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: Text(context.locale.feature1),
          isThreeLine: true,
          subtitle: Text(
            context.locale.feature1Desc,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.grid_view_rounded),
          title: Text(context.locale.feature2),
          isThreeLine: true,
          subtitle: Text(
            context.locale.feature2Desc,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.rule),
          title: Text(context.locale.feature3),
          isThreeLine: true,
          subtitle: Text(
            context.locale.feature3Desc,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.select_all_rounded),
          title: Text(context.locale.feature4),
          isThreeLine: true,
          subtitle: Text(
            context.locale.feature4Desc,
          ),
        ),
      ],
    );
    final getStarted = ListView(children: [
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
        shape: const RoundedRectangleBorder(borderRadius: radius12),
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
        shape: const RoundedRectangleBorder(borderRadius: radius12),
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.feedback),
        title: Text(context.locale.shareYourFeedback),
        subtitle: Text(context.locale.shareYourFeedbackDesc),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: openSupport,
        shape: const RoundedRectangleBorder(borderRadius: radius12),
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
      )
    ]);
    return Dialog(
      insetPadding: const EdgeInsets.all(padding14),
      child: DefaultTabController(
        length: 2,
        child: LayoutBuilder(builder: (context, constraints) {
          final isVisible =
              constraints.maxWidth >= 800 && constraints.maxHeight >= 550;

          if (!isVisible) {
            return Column(
              children: [
                const TabBar(tabs: [
                  Tab(
                    text: "What's New?",
                  ),
                  Tab(text: "Getting Started"),
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: whatsNew,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: getStarted,
                      ),
                    ],
                  ),
                )
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.all(padding20),
            child: SizedBox(
              width: 800,
              height: 550,
              child: Row(
                children: [
                  Expanded(child: whatsNew),
                  const VerticalDivider(),
                  Expanded(child: getStarted),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
