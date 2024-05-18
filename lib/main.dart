import 'dart:async';

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:clipboard/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:clipboard/common/color_schemes.dart';
import 'package:clipboard/constants/key.dart';
import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/l10n/generated/app_localizations.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/utils/windows/update_registry.dart';
import 'package:clipboard/widgets/app_link_listener.dart';
import 'package:clipboard/widgets/event_bridge.dart';
import 'package:clipboard/widgets/share_listener.dart';
import 'package:clipboard/widgets/system_shortcut_listeners.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

import 'common/bloc_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop) {
    await windowManager.ensureInitialized();

    if (kDebugMode) {
      await hotKeyManager.unregisterAll();
    }

    final packageInfo = await PackageInfo.fromPlatform();
    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
    );

    WindowOptions windowOptions = const WindowOptions(
      size: initialWindowSize,
      minimumSize: minimumWindowSize,
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions).then((_) async {
      await windowManager.setClosable(false);
      await windowManager.minimize();
    });

    await updateWindowsRegistry();
  } else {
    unawaited(MobileAds.instance.initialize());
  }

  Bloc.observer = CustomBlocObserver();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<AppConfigCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SyncManagerCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<OfflinePersistanceCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<CloudPersistanceCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<ClipCollectionCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<DriveSetupCubit>(
          create: (context) => sl(),
        ),
        if (isDesktop)
          BlocProvider<WindowActionCubit>(
            create: (context) => sl()..fetch(),
          ),
      ],
      child: EventBridge(
        child: WindowFocusManager.fromPlatform(
          child: ShareListener.fromPlatform(
            child: SystemShortcutListener(
              child: AppLinkListener(
                child: DevicePreview(
                  enabled: false,
                  builder: (context) =>
                      BlocSelector<AppConfigCubit, AppConfigState, ThemeMode>(
                    selector: (state) {
                      return state.config.themeMode;
                    },
                    builder: (context, state) {
                      return MaterialApp.router(
                        scaffoldMessengerKey: scaffoldMessengerKey,
                        routeInformationParser: router.routeInformationParser,
                        routeInformationProvider:
                            router.routeInformationProvider,
                        routerDelegate: router.routerDelegate,
                        backButtonDispatcher: router.backButtonDispatcher,
                        themeMode: state,
                        theme: ThemeData(
                          useMaterial3: true,
                          textTheme: textTheme.apply(
                            bodyColor: lightColorScheme.onSurface,
                            displayColor: lightColorScheme.onSurface,
                          ),
                          colorScheme: lightColorScheme,
                          brightness: Brightness.light,
                          inputDecorationTheme: const InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: radius12,
                            ),
                          ),
                        ),
                        darkTheme: ThemeData(
                          useMaterial3: true,
                          textTheme: textTheme.apply(
                            bodyColor: darkColorScheme.onSurface,
                            displayColor: darkColorScheme.onSurface,
                          ),
                          colorScheme: darkColorScheme,
                          brightness: Brightness.dark,
                          inputDecorationTheme: const InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates:
                            AppLocalizations.localizationsDelegates,
                        supportedLocales: AppLocalizations.supportedLocales,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
