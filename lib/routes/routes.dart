import "package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart";
import "package:clipboard/constants/key.dart";
import "package:clipboard/constants/strings/route_constants.dart";
import "package:clipboard/pages/drive_setup/page.dart";
import "package:clipboard/pages/home/page.dart";
import "package:clipboard/pages/layout/navbar_layout.dart";
import "package:clipboard/pages/login/page.dart";
import "package:clipboard/pages/not_found_page.dart";
import "package:clipboard/pages/search/page.dart";
import "package:clipboard/pages/settings/page.dart";
import "package:clipboard/pages/splash_page.dart";
import "package:flutter_bloc/flutter_bloc.dart";
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
      ),
    ),
    GoRoute(
      name: RouteConstants.login,
      path: '/login',
      builder: (context, state) => LoginPage(
        key: state.pageKey,
      ),
    ),
    GoRoute(
      name: RouteConstants.driveConnect,
      path: '/drive-connect/:code',
      builder: (context, state) {
        final code = state.pathParameters["code"]!;
        final scopes = state.uri.queryParameters["scopes"]!.split(" ");
        context.read<DriveSetupCubit>().verifyAuthCodeAndSetup(code, scopes);
        return DriveSetupPage(
          key: state.pageKey,
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        final activeIndex = switch (state.fullPath) {
          "/home" => 0,
          "/search" => 1,
          "/settings" => 3,
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
        GoRoute(
          name: RouteConstants.settings,
          path: '/settings',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
      ],
    )
  ],
);
