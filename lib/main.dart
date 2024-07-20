import 'dart:async';

import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart';
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
import 'package:clipboard/widgets/auth_listener.dart';
import 'package:clipboard/widgets/event_bridge.dart';
import 'package:clipboard/widgets/rebuilding_db.dart';
import 'package:clipboard/widgets/system_shortcut_listeners.dart';
import 'package:clipboard/widgets/tray_manager.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';
import 'package:upgrader/upgrader.dart';
import 'package:window_manager/window_manager.dart';

import 'common/bloc_config.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const MainApp());
}

Future<void> initializeServices() async {
  if (kDebugMode) {
    Bloc.observer = CustomBlocObserver();
    await Upgrader.clearSavedSettings();
  }
  if (isDesktopPlatform) {
    await initializeDesktopServices();
  } else {
    unawaited(MobileAds.instance.initialize());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  await initializeFirebase();
  await configureDependencies();
}

Future<void> initializeDesktopServices() async {
  await windowManager.ensureInitialized();
  await updateWindowsRegistry();

  if (kDebugMode) {
    await hotKeyManager.unregisterAll();
  }

  final packageInfo = await PackageInfo.fromPlatform();
  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  WindowOptions windowOptions = WindowOptions(
    size: initialWindowSize,
    minimumSize: minimumWindowSize,
    center: true,
    // make sure to change it in main.cpp ( windows ) &
    // my_application.cc ( linux ) and other places too if changing the title.
    title: "CopyCat Clipboard",
    titleBarStyle:
        Platform.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions).then((_) async {
    await windowManager.setClosable(false);
    await windowManager.setSkipTaskbar(true);
    if (Platform.isMacOS) {
      await windowManager.setVisibleOnAllWorkspaces(false,
          visibleOnFullScreen: true);
    }
  });
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (isAnalyticsSupported) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}

final router_ = router([
  if (isAnalyticsSupported) FirebaseAnalyticsObserver(analytics: analytics)
]);

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();
    return BlocListener<MonetizationCubit, MonetizationState>(
      listener: (context, state) {
        switch (state) {
          case MonetizationActive(:final subscription):
            context.read<SyncManagerCubit>().syncHours = subscription.syncHours;
            context.read<AppConfigCubit>().load(subscription);
        }
      },
      child: BlocSelector<AppConfigCubit, AppConfigState, (ThemeMode, String)>(
        selector: (state) {
          return (state.config.themeMode, state.config.locale);
        },
        builder: (context, state) {
          final (theme, langCode) = state;
          return GestureDetector(
            onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp.router(
              scaffoldMessengerKey: scaffoldMessengerKey,
              routeInformationParser: router_.routeInformationParser,
              routeInformationProvider: router_.routeInformationProvider,
              routerDelegate: router_.routerDelegate,
              backButtonDispatcher: router_.backButtonDispatcher,
              themeMode: theme,
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
                    borderRadius: radius12,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              locale: Locale(langCode.isEmpty ? "en" : langCode),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final child = MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => sl()),
        BlocProvider<AppConfigCubit>(create: (context) => sl()),
        BlocProvider<MonetizationCubit>(create: (context) => sl()),
        BlocProvider<SyncManagerCubit>(create: (context) => sl()),
        BlocProvider<OfflinePersistanceCubit>(create: (context) => sl()),
        BlocProvider<CloudPersistanceCubit>(create: (context) => sl()),
        BlocProvider<ClipCollectionCubit>(create: (context) => sl()),
        BlocProvider<DriveSetupCubit>(create: (context) => sl()),
        if (isDesktopPlatform)
          BlocProvider<WindowActionCubit>(create: (context) => sl()..fetch()),
      ],
      child: AuthListener(
        child: EventBridge(
          child: WindowFocusManager.fromPlatform(
            child: TrayManager.fromPlatform(
              child: const SystemShortcutListener(
                child: RebuildingDbOverlay(
                  child: AppLinkListener(
                    child: AppContent(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (kDebugMode) {
      return DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
          DevicePreviewScreenshot(
            onScreenshot: screenshotAsFile,
          ),
        ],
        builder: (context) => child,
      );
    }
    return child;
  }
}
