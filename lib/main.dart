import 'dart:async';

import 'package:clipboard/di/di.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/app_link_listener.dart';
import 'package:clipboard/widgets/auth_listener.dart';
import 'package:clipboard/widgets/event_bridge.dart';
import 'package:clipboard/widgets/state_initializer.dart';
import 'package:clipboard/widgets/system_shortcut_listeners.dart';
import 'package:clipboard/widgets/tray_manager.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:copycat_base/bloc/android_bg_clipboard_cubit/android_bg_clipboard_cubit.dart';
import 'package:copycat_base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:copycat_base/bloc/auth_cubit/auth_cubit.dart';
import 'package:copycat_base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:copycat_base/bloc/clip_sync_manager_cubit/clip_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart';
import 'package:copycat_base/bloc/collection_sync_manager_cubit/collection_sync_manager_cubit.dart';
import 'package:copycat_base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:copycat_base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:copycat_base/bloc/realtime_clip_sync_cubit/realtime_clip_sync_cubit.dart';
import 'package:copycat_base/bloc/realtime_collection_sync_cubit/realtime_collection_sync_cubit.dart';
import 'package:copycat_base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:copycat_base/common/bloc_config.dart';
import 'package:copycat_base/constants/key.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/generated/app_localizations.dart';
import 'package:copycat_base/utils/utility.dart';
import 'package:copycat_base/utils/windows/update_registry.dart';
import 'package:copycat_base/widgets/android_bg_clipboard_state_listener.dart';
import 'package:copycat_pro/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:universal_io/io.dart';
import 'package:upgrader/upgrader.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  if (sentryDSN != "") {
    await SentryFlutter.init(
      (options) {
        options.dsn = sentryDSN;
        options.environment = kDebugMode ? "Dev" : "Prod";
        options.tracesSampleRate = kDebugMode ? 0 : 0.05;
        options.profilesSampleRate = kDebugMode ? 0 : 0.5;
      },
      appRunner: () async {
        WidgetsFlutterBinding.ensureInitialized();
        await initializeServices();
        runApp(const MainApp());
      },
    );
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeServices();
    runApp(const MainApp());
  }
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
  }

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  await configureDependencies();
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  timeago.setLocaleMessages('de', timeago.DeMessages());
  timeago.setLocaleMessages('zh', timeago.ZhCnMessages());
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

  WindowOptions windowOptions = const WindowOptions(
    // size:  minimumWindowSize,
    // minimumSize: minimumWindowSize,
    // make sure to change it in main.cpp ( windows ) &
    // my_application.cc ( linux ) and other places too if changing the title.
    title: "CopyCat Clipboard",
    skipTaskbar: true,
    windowButtonVisibility: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );
  unawaited(windowManager.waitUntilReadyToShow(windowOptions).then((_) async {
    // if (Platform.isMacOS) {
    //   await windowManager.setVisibleOnAllWorkspaces(
    //     true,
    //     visibleOnFullScreen: true,
    //   );
    // }
    windowManager.hide();
  }));
}

final router_ = router();

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();
    return BlocListener<MonetizationCubit, MonetizationState>(
      listenWhen: (prev, current) {
        if (current is MonetizationActive && prev is MonetizationActive) {
          return !current.subscription.isSameAs(prev.subscription);
        }
        return true;
      },
      listener: (context, state) async {
        switch (state) {
          case MonetizationActive(:final subscription):
            {
              final clipSyncCubit = context.read<ClipSyncManagerCubit>();
              final collectionSyncCubit =
                  context.read<CollectionSyncManagerCubit>();
              final appConfigCubit = context.read<AppConfigCubit>();
              appConfigCubit.load(subscription);
              clipSyncCubit.changeConfig(
                syncHours: subscription.syncHours,
                manualDelay: subscription.syncInterval,
              );
              collectionSyncCubit.changeConfig(
                syncHours: subscription.syncHours,
                manualDelay: subscription.syncInterval,
              );

              await collectionSyncCubit.syncCollections();
              // This will trigger clip syncing in event bridge
            }
        }
      },
      child: StateInitializer(
        child: BlocSelector<AppConfigCubit, AppConfigState,
            (ThemeMode, String, ColorScheme, ColorScheme)>(
          selector: (state) {
            return (
              state.config.themeMode,
              state.config.locale,
              state.config.lightThemeColorScheme,
              state.config.darkThemeColorScheme,
            );
          },
          builder: (context, state) {
            final (theme, langCode, lightColorScheme, darkColorScheme) = state;
            return MaterialApp.router(
              scaffoldMessengerKey: scaffoldMessengerKey,
              routeInformationParser: router_.routeInformationParser,
              routeInformationProvider: router_.routeInformationProvider,
              routerDelegate: router_.routerDelegate,
              backButtonDispatcher: router_.backButtonDispatcher,
              color: Colors.transparent,
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
            );
          },
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = AuthListener(
      child: EventBridge(
        child: WindowFocusManager.forPlatform(
          child: TrayManager.forPlatform(
            child: const SystemShortcutListener(
              child: AppLinkListener(
                child: AppContent(),
              ),
            ),
          ),
        ),
      ),
    );
    if (Platform.isAndroid) {
      content = AndroidBgClipboardStateListener(child: content);
    }
    final child = MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => sl()),
        BlocProvider<AppConfigCubit>(create: (context) => sl()..load()),
        BlocProvider<MonetizationCubit>(create: (context) => sl()),
        // BlocProvider<SyncManagerCubit>(create: (context) => sl()),
        BlocProvider<ClipSyncManagerCubit>(create: (context) => sl()),
        BlocProvider<CollectionSyncManagerCubit>(create: (context) => sl()),
        BlocProvider<OfflinePersistanceCubit>(create: (context) => sl()),
        BlocProvider<CloudPersistanceCubit>(create: (context) => sl()),
        BlocProvider<ClipCollectionCubit>(create: (context) => sl()),
        BlocProvider<DriveSetupCubit>(create: (context) => sl()),
        BlocProvider<WindowActionCubit>(create: (context) => sl()),
        BlocProvider<RealtimeClipSyncCubit>(create: (context) => sl()),
        BlocProvider<RealtimeCollectionSyncCubit>(create: (context) => sl()),
        if (Platform.isAndroid)
          BlocProvider<AndroidBgClipboardCubit>(
            lazy: false,
            create: (context) {
              return sl()..syncStates();
            },
          ),
      ],
      child: isMobilePlatform
          ? GestureDetector(
              onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
              child: content,
            )
          : content,
    );

    if (kDebugMode) {
      return DevicePreview(
        enabled: false,
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
