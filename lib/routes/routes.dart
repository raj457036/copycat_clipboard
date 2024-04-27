import "package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart";
import "package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart";
import "package:clipboard/bloc/collection_clips_cubit/collection_clips_cubit.dart";
import "package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart";
import "package:clipboard/bloc/search_cubit/search_cubit.dart";
import "package:clipboard/constants/key.dart";
import "package:clipboard/constants/strings/route_constants.dart";
import "package:clipboard/db/clip_collection/clipcollection.dart";
import "package:clipboard/di/di.dart";
import "package:clipboard/pages/collections/page.dart";
import "package:clipboard/pages/collections/pages/create_edit/page.dart";
import "package:clipboard/pages/collections/pages/details/page.dart";
import "package:clipboard/pages/drive_setup/page.dart";
import "package:clipboard/pages/home/page.dart";
import "package:clipboard/pages/layout/navbar_layout.dart";
import "package:clipboard/pages/login/page.dart";
import "package:clipboard/pages/not_found_page.dart";
import "package:clipboard/pages/preview/page.dart";
import "package:clipboard/pages/search/page.dart";
import "package:clipboard/pages/settings/page.dart";
import "package:clipboard/pages/splash_page.dart";
import "package:clipboard/widgets/page_route/dynamic_page_route.dart";
import "package:flutter/material.dart";
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
    GoRoute(
      name: RouteConstants.preview,
      path: "/preview/:id",
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters["id"]!);
        final item = context.read<ClipboardCubit>().getItem(id: id);
        if (item == null) {
          return const MaterialPage(
            child: NotFoundPage(),
          );
        }
        return DynamicPage(
          key: state.pageKey,
          builder: (context, isDialog) => ClipboardItemPreviewPage(
            item: item,
            isDialog: isDialog,
          ),
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        final firstSegment = state.uri.pathSegments.first;
        final depth = state.uri.pathSegments.length;
        final activeIndex = switch (firstSegment) {
          "home" => 0,
          "search" => 1,
          "collections" => 2,
          "settings" => 3,
          _ => 0,
        };

        return NavBarPage(
          navbarActiveIndex: activeIndex,
          depth: depth,
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
            child: BlocProvider<SearchCubit>(
              create: (context) => sl(),
              child: const SearchPage(),
            ),
          ),
        ),
        GoRoute(
          name: RouteConstants.collections,
          path: '/collections',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const CollectionsPage(),
          ),
          routes: [
            GoRoute(
              name: RouteConstants.collectionDetail,
              path: ":id",
              pageBuilder: (context, state) {
                final id = int.parse(state.pathParameters["id"]!);

                final collection = context.read<ClipCollectionCubit>().get(id);

                if (collection == null) {
                  return const MaterialPage(child: NotFoundPage());
                }
                return NoTransitionPage(
                  key: state.pageKey,
                  child: BlocProvider<CollectionClipsCubit>(
                    create: (context) => sl(param1: collection)..search(),
                    child: CollectionDetailPage(collection: collection),
                  ),
                );
              },
            ),
            GoRoute(
              name: RouteConstants.createEditCollection,
              path: 'write/:id',
              pageBuilder: (context, state) {
                final id = state.pathParameters["id"] ?? "new";
                ClipCollection? collection;

                if (id != "new") {
                  final id_ = int.tryParse(id);
                  if (id_ != null) {
                    collection = context.read<ClipCollectionCubit>().get(id_);
                  }
                }

                return DynamicPage(
                  key: state.pageKey,
                  builder: (context, isDialog) {
                    return ClipCollectionCreateEditPage(
                      isDialog: isDialog,
                      collection: collection,
                    );
                  },
                );
              },
            ),
          ],
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
