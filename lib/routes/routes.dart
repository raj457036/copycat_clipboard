import "package:clipboard/constants/key.dart";
import "package:clipboard/constants/strings/route_constants.dart";
import "package:clipboard/di/di.dart";
import "package:clipboard/pages/home/page.dart";
import "package:clipboard/pages/layout/navbar_layout.dart";
import "package:clipboard/pages/login/page.dart";
import "package:clipboard/pages/not_found_page.dart";
import "package:clipboard/pages/search/page.dart";
import "package:clipboard/pages/splash_page.dart";
import "package:go_router/go_router.dart";

const rootLocation = "/";
final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavKey,
  initialLocation: rootLocation,
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      name: RouteConstants.spalsh,
      path: rootLocation,
      builder: (context, state) => SplashPage(
        key: state.pageKey,
        account: sl(),
      ),
    ),
    GoRoute(
      name: RouteConstants.login,
      path: '/login',
      builder: (context, state) => LoginPage(
        key: state.pageKey,
        account: sl(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        final activeIndex = switch (state.fullPath) {
          "/home" => 0,
          "/search" => 1,
          _ => 0,
        };

        return NavBarPage(
          navbarActiveIndex: activeIndex,
          child: child,
        );
      },
      routes: [
        GoRoute(
          name: RouteConstants.home,
          path: "/home",
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
            );
          },
        ),
        GoRoute(
          name: RouteConstants.search,
          path: '/search',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SearchPage(),
          ),
        ),
      ],
    )
  ],
);
