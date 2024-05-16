//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <focus_window/focus_window_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) focus_window_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FocusWindowPlugin");
  focus_window_plugin_register_with_registrar(focus_window_registrar);
}
