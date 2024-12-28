//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <pro_plus/pro_plus_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) pro_plus_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ProPlusPlugin");
  pro_plus_plugin_register_with_registrar(pro_plus_registrar);
}
