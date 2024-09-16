import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/app_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/pattern_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/title_text_exclusion.dart';
import 'package:clipboard/pages/settings/pages/custom_exclusion_rule/tabs/url_text_exclusion.dart';
import 'package:clipboard/widgets/scaffold_body.dart';
import 'package:copycat_base/constants/widget_styles.dart';
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
        title: const Text("Exclusion Rules"),
        centerTitle: false,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            extended: true,
            minExtendedWidth: 140,
            onDestinationSelected: onDestinationSelected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.apps),
                label: Text("Apps"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.abc),
                label: Text("Title"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.link),
                label: Text("Url"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.pattern_rounded),
                label: Text("Pattern"),
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
