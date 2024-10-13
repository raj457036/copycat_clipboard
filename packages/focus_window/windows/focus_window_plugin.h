#ifndef FLUTTER_PLUGIN_FOCUS_WINDOW_PLUGIN_H_
#define FLUTTER_PLUGIN_FOCUS_WINDOW_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace focus_window {

class FocusWindowPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FocusWindowPlugin();

  virtual ~FocusWindowPlugin();

  // Disallow copy and assign.
  FocusWindowPlugin(const FocusWindowPlugin&) = delete;
  FocusWindowPlugin& operator=(const FocusWindowPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace focus_window

#endif  // FLUTTER_PLUGIN_FOCUS_WINDOW_PLUGIN_H_
