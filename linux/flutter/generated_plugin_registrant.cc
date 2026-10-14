//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <app_links_linux/app_links_plugin_linux.h>
#include <clipboard_watcher/clipboard_watcher_plugin.h>
#include <emoji_picker_flutter/emoji_picker_flutter_plugin.h>
#include <fc_native_video_thumbnail/fc_native_video_thumbnail_plugin.h>
#include <flutter_platform_alert/flutter_platform_alert_plugin.h>
#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>
#include <focus_window/focus_window_plugin.h>
#include <hotkey_manager_linux/hotkey_manager_linux_plugin.h>
#include <irondash_engine_context/irondash_engine_context_plugin.h>
#include <isar_community_flutter_libs/isar_flutter_libs_plugin.h>
#include <media_kit_libs_linux/media_kit_libs_linux_plugin.h>
#include <media_kit_video/media_kit_video_plugin.h>
#include <no_screenshot/no_screenshot_plugin.h>
#include <open_dir_linux/open_dir_linux_plugin.h>
#include <screen_retriever_linux/screen_retriever_linux_plugin.h>
#include <super_native_extensions/super_native_extensions_plugin.h>
#include <tray_manager/tray_manager_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>
#include <window_manager/window_manager_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) app_links_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AppLinksPluginLinux");
  app_links_plugin_linux_register_with_registrar(app_links_linux_registrar);
  g_autoptr(FlPluginRegistrar) clipboard_watcher_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ClipboardWatcherPlugin");
  clipboard_watcher_plugin_register_with_registrar(clipboard_watcher_registrar);
  g_autoptr(FlPluginRegistrar) emoji_picker_flutter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "EmojiPickerFlutterPlugin");
  emoji_picker_flutter_plugin_register_with_registrar(emoji_picker_flutter_registrar);
  g_autoptr(FlPluginRegistrar) fc_native_video_thumbnail_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FcNativeVideoThumbnailPlugin");
  fc_native_video_thumbnail_plugin_register_with_registrar(fc_native_video_thumbnail_registrar);
  g_autoptr(FlPluginRegistrar) flutter_platform_alert_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterPlatformAlertPlugin");
  flutter_platform_alert_plugin_register_with_registrar(flutter_platform_alert_registrar);
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
  g_autoptr(FlPluginRegistrar) focus_window_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FocusWindowPlugin");
  focus_window_plugin_register_with_registrar(focus_window_registrar);
  g_autoptr(FlPluginRegistrar) hotkey_manager_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HotkeyManagerLinuxPlugin");
  hotkey_manager_linux_plugin_register_with_registrar(hotkey_manager_linux_registrar);
  g_autoptr(FlPluginRegistrar) irondash_engine_context_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "IrondashEngineContextPlugin");
  irondash_engine_context_plugin_register_with_registrar(irondash_engine_context_registrar);
  g_autoptr(FlPluginRegistrar) isar_community_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "IsarFlutterLibsPlugin");
  isar_flutter_libs_plugin_register_with_registrar(isar_community_flutter_libs_registrar);
  g_autoptr(FlPluginRegistrar) media_kit_libs_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MediaKitLibsLinuxPlugin");
  media_kit_libs_linux_plugin_register_with_registrar(media_kit_libs_linux_registrar);
  g_autoptr(FlPluginRegistrar) media_kit_video_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MediaKitVideoPlugin");
  media_kit_video_plugin_register_with_registrar(media_kit_video_registrar);
  g_autoptr(FlPluginRegistrar) no_screenshot_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NoScreenshotPlugin");
  no_screenshot_plugin_register_with_registrar(no_screenshot_registrar);
  g_autoptr(FlPluginRegistrar) open_dir_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "OpenDirLinuxPlugin");
  open_dir_linux_plugin_register_with_registrar(open_dir_linux_registrar);
  g_autoptr(FlPluginRegistrar) screen_retriever_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ScreenRetrieverLinuxPlugin");
  screen_retriever_linux_plugin_register_with_registrar(screen_retriever_linux_registrar);
  g_autoptr(FlPluginRegistrar) super_native_extensions_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SuperNativeExtensionsPlugin");
  super_native_extensions_plugin_register_with_registrar(super_native_extensions_registrar);
  g_autoptr(FlPluginRegistrar) tray_manager_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TrayManagerPlugin");
  tray_manager_plugin_register_with_registrar(tray_manager_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
  g_autoptr(FlPluginRegistrar) window_manager_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowManagerPlugin");
  window_manager_plugin_register_with_registrar(window_manager_registrar);
}
