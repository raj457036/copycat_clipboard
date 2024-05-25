import 'package:clipboard/common/logging.dart';
import 'package:clipboard/routes/utils.dart';
import 'package:clipboard/widgets/ads/home_banner.dart';
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
    final scaffold = Scaffold(
      body: widget.child,
      floatingActionButton: smallScreen && widget.depth == 1
          ? getFloatingActionButton(context, widget.navbarActiveIndex,
              isMobile: smallScreen)
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: smallScreen && widget.depth == 1
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HomeBannerAd(
                  key: ValueKey("home-banner-ad"),
                ),
                NavigationBar(
                  selectedIndex: widget.navbarActiveIndex,
                  onDestinationSelected: (idx) => onNavItemTapped(context, idx),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.paste_rounded),
                      label: "Clipboard",
                      tooltip: "Clipboard",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.content_paste_search_rounded),
                      label: "Search",
                      tooltip: "Search Clipboard",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.collections_bookmark),
                      label: "Collections",
                      tooltip: "Collections",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings),
                      label: "Settings",
                      tooltip: "Settings",
                    ),
                  ],
                ),
              ],
            )
          : null,
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
