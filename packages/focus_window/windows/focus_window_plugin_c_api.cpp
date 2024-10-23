#include "include/focus_window/focus_window_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "focus_window_plugin.h"

void FocusWindowPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  focus_window::FocusWindowPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
