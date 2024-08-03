import 'package:clipboard/utils/clipboard_actions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/create_collection_button.dart';
import 'package:clipboard/widgets/local_user.dart';
import 'package:clipboard/widgets/sync_status.dart';
import 'package:copycat_base/constants/strings/route_constants.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void onNavItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.goNamed(RouteConstants.home);
      break;
    case 1:
      context.goNamed(RouteConstants.search);
      break;
    case 2:
      context.goNamed(RouteConstants.collections);
      break;
    case 3:
      context.goNamed(RouteConstants.settings);
      break;
    default:
  }
}

Widget? getFloatingActionButton(BuildContext context, int navbarActiveIndex,
    {bool isMobile = false}) {
  if (navbarActiveIndex == 0) {
    final actions = [
      FloatingActionButton(
        onPressed: () => pasteContent(context),
        tooltip: isDesktopPlatform ? "Paste • $metaKey + V" : 'Paste',
        heroTag: "paste-fab",
        child: const Icon(Icons.content_paste_go_rounded),
      ),
      height8,
      const SyncStatusButton()
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: isMobile ? actions.reversed.toList() : actions,
    );
  }
  if (navbarActiveIndex == 2) {
    final actions = [
      const DisableForLocalUser(
        ifLocal: CreateCollectionButton(
          localMode: true,
        ),
        child: CreateCollectionButton(),
      ),
      height8,
      const SyncStatusButton()
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: isMobile ? actions.reversed.toList() : actions,
    );
  }
  return null;
}

Future<void> waitHere(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}
