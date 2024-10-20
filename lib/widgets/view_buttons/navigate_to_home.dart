import 'package:clipboard/utils/extensions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationButtons extends StatefulWidget {
  const NavigationButtons({super.key});

  @override
  State<NavigationButtons> createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<NavigationButtons> {
  @override
  Widget build(BuildContext context) {
    final location = context.location;
    final isHome = location == RouteConstants.home;
    return IconButton(
      onPressed: () async {
        if (isHome) {
          context.goNamed(RouteConstants.collections);
        } else {
          context.goNamed(RouteConstants.home);
        }
        setState(() {});
      },
      padding: EdgeInsets.zero,
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(),
      ),
      iconSize: 20,
      icon: isHome
          ? const Icon(Icons.collections_bookmark)
          : const Icon(Icons.paste_rounded),
      tooltip: !isHome
          ? "${context.locale.clipboard} • $metaKey + D"
          : "${context.locale.collections} • $metaKey + C",
    );
  }
}
