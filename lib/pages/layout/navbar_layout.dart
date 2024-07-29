import 'package:copycat_base/common/logging.dart';
import 'package:clipboard/l10n/l10n.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/network_observer.dart';
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
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const HomeBannerAd(
                  //   key: ValueKey("home-banner-ad"),
                  // ),
                  NavigationBar(
                    selectedIndex: widget.navbarActiveIndex,
                    onDestinationSelected: (idx) =>
                        onNavItemTapped(context, idx),
                    // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                    destinations: [
                      NavigationDestination(
                        icon: const Icon(Icons.paste_rounded),
                        label: context.locale.clipboard.substring(0, 8),
                        tooltip: context.locale.clipboard,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.content_paste_search_rounded),
                        label: context.locale.search,
                        tooltip: context.locale.searchClipboard,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.collections_bookmark),
                        label: context.locale.collections,
                        tooltip: context.locale.collections,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.settings),
                        label: context.locale.settings.substring(0, 8),
                        tooltip: context.locale.settings,
                      ),
                    ],
                  ),
                ],
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
