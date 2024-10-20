import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/app_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/pattern_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/title_text_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/url_text_exclusion.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CustomExclusionRulePage extends StatefulWidget {
  const CustomExclusionRulePage({super.key});

  @override
  State<CustomExclusionRulePage> createState() =>
      _CustomExclusionRulePageState();
}

class _CustomExclusionRulePageState extends State<CustomExclusionRulePage> {
  int selectedIndex = 0;

  void onDestinationSelected(int selected) {
    setState(() {
      selectedIndex = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.customExclusionRules),
        centerTitle: false,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            extended: true,
            minExtendedWidth: 140,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.apps),
                label: Text(context.locale.apps),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.abc),
                label: Text(context.locale.title),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.link),
                label: Text(context.locale.url),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.pattern_rounded),
                label: Text(context.locale.pattern),
              ),
            ],
          ),
          Expanded(
            child: ScaffoldBody(
              margin: const EdgeInsets.only(
                right: padding12,
                left: padding12,
              ),
              child: switch (selectedIndex) {
                0 => const AppExclusionTab(),
                1 => const TitleTextExclusionTab(),
                2 => const UrlTextExclusionTab(),
                _ => const PatternExclusionTab(),
              },
            ),
          ),
        ],
      ),
    );
  }
}
