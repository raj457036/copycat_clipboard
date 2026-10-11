import 'dart:async';

import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/app_lock_cubit/app_lock_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/bloc/event_bus_cubit/event_bus_cubit.dart';
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/bloc/review_prompt_cubit/review_prompt_cubit.dart';
import 'package:clipboard/base/bloc/sync_status_cubit/sync_status_cubit.dart';
import 'package:clipboard/base/bloc/user_devices_cubit/user_devices_cubit.dart';
import 'package:clipboard/base/bloc/window_action_cubit/window_action_cubit.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/data/services/notification_service.dart'
    show InAppNotificationService;
import 'package:clipboard/base/domain/model/app_config/appconfig.dart';
import 'package:clipboard/base/l10n/generated/app_localizations.dart';
import 'package:clipboard/base/theme/theme_builder.dart';
import 'package:clipboard/common/bloc_config.dart';
import 'package:clipboard/common/file_log_sink.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/scroll_behaviour.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/utils/windows/update_registry.dart';
import 'package:clipboard/widgets/app_lock_overlay.dart';
import 'package:clipboard/widgets/debug/gizmo_overlay.dart';
import 'package:clipboard/widgets/forms/supabase_auth_localization.dart'
    show SupabaseAuthLocalizationsDelegate;
import 'package:clipboard/widgets/keyboard_shortcuts/actions/select_all.dart';
import 'package:clipboard/widgets/listeners/auth_listener.dart';
import 'package:clipboard/widgets/listeners/monetization_listener.dart';
import 'package:clipboard/widgets/state_initializer.dart';
import 'package:clipboard/widgets/system_shortcut_listeners.dart';
import 'package:clipboard/widgets/tray_manager.dart';
import 'package:clipboard/widgets/upgrader.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
// ignore: implementation_imports
import 'package:form_validator/src/i18n/all.dart' as fv_locale;
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:media_kit/media_kit.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:universal_io/io.dart';
import 'package:upgrader/upgrader.dart';
import 'package:window_manager/window_manager.dart';

import 'widgets/keyboard_shortcuts/actions/actions.dart';
import 'widgets/keyboard_shortcuts/arrow_focus_visibility_listener.dart';

Future<void> appRunner() async {
  if (Platform.isWindows || Platform.isLinux) {
    MediaKit.ensureInitialized();
  }
  await FileLogSink.instance.init();
  await initializeServices();
  runApp(const MainApp());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSize = 20;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20;

  await appRunner();
}

Future<void> initializeServices() async {
  if (kDebugMode) {
    Bloc.observer = CustomBlocObserver();
    await Upgrader.clearSavedSettings();
  }
  if (isDesktopPlatform) {
    await initializeDesktopServices();
  }

  await configureDependencies();
  timeago.setLocaleMessages('fr', timeago.FrMessages());
  timeago.setLocaleMessages('de', timeago.DeMessages());
  timeago.setLocaleMessages('zh', timeago.ZhCnMessages());
}

Future<void> initializeDesktopServices() async {
  final englishL10n = await lookupAppLocalizations(const Locale('en'));
  await windowManager.ensureInitialized();
  await updateWindowsRegistry();

  if (kDebugMode) await hotKeyManager.unregisterAll();

  final packageInfo = await PackageInfo.fromPlatform();
  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );

  WindowOptions windowOptions = WindowOptions(
    size: initialWindowSize,
    minimumSize: minimumWindowSize,
    // make sure to change it in main.cpp ( windows ) &
    // ? my_application.cc ( linux ) and other places too if changing the title.
    title: englishL10n.app__name,
    skipTaskbar: kReleaseMode,
    windowButtonVisibility: true,
  );
  unawaited(
    windowManager.waitUntilReadyToShow(windowOptions).then((_) async {
      if (kDebugMode) {
        return windowManager.show();
      } else {
        return windowManager.hide();
      }
    }),
  );
}

void updateValidatorLanguage(String langCode) {
  final locale =
      fv_locale.supportedLocales.findFirst((l) => l.startsWith(langCode)) ??
      "en";
  ValidationBuilder.setLocale(locale);
}

class AppContent extends StatelessWidget {
  const AppContent({super.key});

  SystemUiOverlayStyle getUiOverlay(ThemeMode mode) {
    var lightTheme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.light;
    return mode == ThemeMode.light || (mode == ThemeMode.system && lightTheme)
        ? const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: false,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          )
        : const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          );
  }

  @override
  Widget build(BuildContext context) {
    final stateInitializer = StateInitializer(
      child: ThemeManager(
        builder: (context, theme, darkTheme, appConfig) {
          updateValidatorLanguage(appConfig.locale);
          final locale = Locale(
            appConfig.locale.isEmpty ? Platform.localeName : appConfig.locale,
          );
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: getUiOverlay(appConfig.themeMode),
            child: MaterialApp.router(
              // restorationScopeId: 'app',
              routerConfig: appRouter,
              scaffoldMessengerKey:
                  InAppNotificationService.scaffoldMessengerKey,
              scrollBehavior: ClampingScrollBehavior(),
              themeMode: appConfig.themeMode,
              shortcuts: {
                ...WidgetsApp.defaultShortcuts,
                NavigateToHomePageIntent.activator:
                    const NavigateToHomePageIntent(),
                NavigateToCollectionPageIntent.activator:
                    const NavigateToCollectionPageIntent(),
                FocusOnSearchFieldIntent.activator:
                    const FocusOnSearchFieldIntent(),
                CreateNewClipNoteIntent.activator:
                    const CreateNewClipNoteIntent(),
                SyncIntent.activator: const SyncIntent(),
                PasteIntent.activator: const PasteIntent(),
                DeleteItemIntent.activator: const DeleteItemIntent(),
                if (appConfig.view == AppView.windowed)
                  NavigateToSettingPageIntent.activator:
                      const NavigateToSettingPageIntent(),
                if (isDesktopPlatform)
                  PopRouteIntent.activator: const PopRouteIntent(),
                PasteByClipIndexIntent.i.activator: PasteByClipIndexIntent.i,
                SelectAllIntent.activator: const SelectAllIntent(),
              },
              actions: {
                ...WidgetsApp.defaultActions,
                NavigateToHomePageIntent: NavigateToHomePageAction(),
                NavigateToCollectionPageIntent:
                    NavigateToCollectionPageAction(),
                FocusOnSearchFieldIntent: FocusOnSearchFieldAction(),
                SyncIntent: SyncAction(),
                CreateNewClipNoteIntent: CreateNewClipNoteAction(),
                PasteIntent: PasteAction(),
                DeleteItemIntent: DeleteSelectedItemsAction(),
                if (isDesktopPlatform) PopRouteIntent: HideWindowAction(),
                if (appConfig.view == AppView.windowed)
                  NavigateToSettingPageIntent: NavigateToSettingPageAction(),
                if (isMobilePlatform)
                  EditableTextTapOutsideIntent:
                      CallbackAction<EditableTextTapOutsideIntent>(
                        onInvoke: (intent) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          return null;
                        },
                      ),
                if (isMobilePlatform)
                  EditableTextTapUpOutsideIntent:
                      CallbackAction<EditableTextTapUpOutsideIntent>(
                        onInvoke: (intent) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          return null;
                        },
                      ),
                PasteByClipIndexIntent: PasteByClipIndexAction(),
                SelectAllIntent: SelectAllAction(),
              },
              theme: theme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              locale: locale,
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                SupabaseAuthLocalizationsDelegate(),
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              builder: (context, child) {
                return AppLockOverlay(child: UpgraderBuilder(child: child));
              },
            ),
          );
        },
      ),
    );
    return MonetizationListener(
      appConfigCubit: sl(),
      child: AuthListener(
        child: isDesktopPlatform
            ? TrayManager(child: stateInitializer)
            : stateInitializer,
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const shortcutListener = SystemShortcutListener(
      child: ArrowFocusVisibilityListener(child: AppContent()),
    );
    final child = MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => sl(), lazy: false),
        BlocProvider<AppConfigCubit>(create: (context) => sl(), lazy: false),
        BlocProvider<WindowActionCubit>(create: (context) => sl()),
        BlocProvider<EventBusCubit>(create: (context) => sl()),
        BlocProvider<UserDevicesCubit>(create: (context) => sl()),
        BlocProvider<MonetizationCubit>(create: (context) => sl()),
        BlocProvider<OfflinePersistenceCubit>(create: (context) => sl()),
        BlocProvider<ReviewPromptCubit>(create: (context) => sl()),
        BlocProvider<SyncStatusCubit>(create: (context) => sl()),
        BlocProvider<AppLockCubit>(create: (context) => sl()),
      ],
      child: isMobilePlatform
          ? shortcutListener
          : WindowFocusManager(
              focusWindow: sl(),
              clipboardService: sl(),
              child: shortcutListener,
            ),
    );

    if (kDebugMode) {
      return GizmoOverlay(
        enabled: true,
        fpsGizmo: false,
        focusGizmo: false,
        child: DevicePreview(
          enabled: true,
          tools: const [
            ...DevicePreview.defaultTools,
            DevicePreviewScreenshot(onScreenshot: screenshotAsFile),
          ],
          builder: (context) => child,
        ),
      );
    }
    return child;
  }
}
