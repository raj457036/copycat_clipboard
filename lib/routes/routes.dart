import "dart:async";

import "package:clipboard/di/di.dart";
import "package:clipboard/pages/account/page.dart";
import "package:clipboard/pages/collections/page.dart";
import "package:clipboard/pages/collections/pages/create_edit/page.dart";
import "package:clipboard/pages/collections/pages/details/page.dart";
import "package:clipboard/pages/drive_setup/page.dart";
import "package:clipboard/pages/home/page.dart";
import "package:clipboard/pages/layout/navbar_layout.dart";
import "package:clipboard/pages/login/page.dart";
import "package:clipboard/pages/not_found_page.dart";
import "package:clipboard/pages/preview/page.dart";
import "package:clipboard/pages/reset_password/page.dart";
import "package:clipboard/pages/search/page.dart";
import "package:clipboard/pages/settings/page.dart";
import "package:clipboard/pages/splash_page.dart";
import "package:clipboard/routes/keyboard_shortcuts/keyboard_shortcut_provider.dart";
import "package:clipboard/widgets/page_route/dynamic_page_route.dart";
import "package:clipboard/widgets/share_listener.dart";
import "package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart";
import "package:copycat_base/bloc/clipboard_cubit/clipboard_cubit.dart";
import "package:copycat_base/bloc/collection_clips_cubit/collection_clips_cubit.dart";
import "package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart";
import "package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart";
import "package:copycat_base/bloc/search_cubit/search_cubit.dart";
import "package:copycat_base/constants/key.dart";
import "package:copycat_base/constants/strings/route_constants.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

const rootLocation = "/";
GoRouter router([List<NavigatorObserver>? observers]) => GoRouter(
      observers: observers,
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
            context
                .read<DriveSetupCubit>()
                .verifyAuthCodeAndSetup(code, scopes);
            return DriveSetupPage(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          name: RouteConstants.resetPassword,
          path: '/reset-password',
          builder: (context, state) {
            return ResetPasswordPage(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          name: RouteConstants.accountDetails,
          path: '/account-details',
          builder: (context, state) {
            return AccountPage(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          name: RouteConstants.preview,
          path: "/preview/:id",
          redirect: idPresentOrRedirect,
          pageBuilder: (context, state) {
            final id = int.parse(state.pathParameters["id"]!);
            final item =
                context.read<OfflinePersistanceCubit>().getItem(id: id);
            return DynamicPage(
              key: state.pageKey,
              fullScreenDialog: true,
              child: FutureBuilder(
                future: item,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ClipboardItemPreviewPage(
                    item: snapshot.data,
                  );
                },
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

            final navPage = ShareListener.fromPlatform(
              child: NavBarPage(
                navbarActiveIndex: activeIndex,
                depth: depth,
                child: child,
              ),
            );

            return FocusScope(
              autofocus: true,
              child: KeyboardShortcutProvider(
                activePageIndex: activeIndex,
                child: navPage,
              ),
            );
          },
          routes: [
            GoRoute(
              name: RouteConstants.home,
              path: "/home",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: BlocProvider<ClipboardCubit>(
                    create: (context) => sl()..fetch(),
                    child: const HomePage(),
                  ),
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
                  redirect: idPresentOrRedirect,
                  pageBuilder: (context, state) {
                    final id = int.parse(state.pathParameters["id"]!);

                    final collection =
                        context.read<ClipCollectionCubit>().get(id);

                    return NoTransitionPage(
                      key: state.pageKey,
                      child: FutureBuilder(
                          future: collection,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return BlocProvider<CollectionClipsCubit>(
                              create: (context) =>
                                  sl(param1: snapshot.data)..search(),
                              child: CollectionDetailPage(
                                collection: snapshot.data,
                              ),
                            );
                          }),
                    );
                  },
                ),
                GoRoute(
                  name: RouteConstants.createEditCollection,
                  path: 'write/:id',
                  // redirect: (context, state) =>
                  //     idPresentOrRedirect(context, state, "new"),
                  pageBuilder: (context, state) {
                    final id = state.pathParameters["id"] ?? "new";

                    return DynamicPage(
                      key: state.pageKey,
                      child: Builder(
                        builder: (context) {
                          if (id == "new") {
                            return const ClipCollectionCreateEditPage();
                          }
                          final id_ = int.parse(id);

                          return FutureBuilder(
                            future:
                                context.read<ClipCollectionCubit>().get(id_),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ClipCollectionCreateEditPage(
                                collection: snapshot.data,
                              );
                            },
                          );
                        },
                      ),
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

FutureOr<String?> idPresentOrRedirect(context, state, [String? validValue]) {
  final id = state.pathParameters["id"];

  if (validValue != null && id == validValue) return null;

  final id_ = int.tryParse(id ?? "");
  if (id_ == null) {
    return "/not-found";
  }
  return null;
}
