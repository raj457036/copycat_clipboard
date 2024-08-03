import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/network_observer.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  final Widget child;
  final int navbarActiveIndex;
  final int drawerActiveIndex;
  final int depth;

  const NavBarPage({
    super.key,
    required this.child,
    this.navbarActiveIndex = 0,
    this.drawerActiveIndex = 0,
    this.depth = 0,
  });

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = context.textTheme;
    final smallScreen = width <= 576;
    final scaffold = NetworkObserver(
      child: Scaffold(
        body: widget.child,
        floatingActionButton: smallScreen && widget.depth == 1
            ? getFloatingActionButton(
                context,
                widget.navbarActiveIndex,
                isMobile: smallScreen,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: smallScreen && widget.depth == 1
            ? NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelTextStyle: textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold)
                      .msp,
                  height: 70,
                ),
                child: NavigationBar(
                  selectedIndex: widget.navbarActiveIndex,
                  onDestinationSelected: (idx) => onNavItemTapped(context, idx),
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(Icons.paste_outlined),
                      selectedIcon: const Icon(Icons.paste_rounded),
                      label: context.locale.clipboard.sub(end: 15),
                      tooltip: context.locale.clipboard,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.content_paste_search_outlined),
                      selectedIcon:
                          const Icon(Icons.content_paste_search_rounded),
                      label: context.locale.search,
                      tooltip: context.locale.searchClipboard,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.collections_bookmark_outlined),
                      selectedIcon:
                          const Icon(Icons.collections_bookmark_rounded),
                      label: context.locale.collections,
                      tooltip: context.locale.collections,
                    ),
                    NavigationDestination(
                      icon: const Icon(Icons.settings_outlined),
                      selectedIcon: const Icon(Icons.settings_rounded),
                      label: context.locale.settings.substring(0, 8),
                      tooltip: context.locale.settings,
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        logger.i("DID POP: $didPop");
      },
      child: scaffold,
    );
  }
}
