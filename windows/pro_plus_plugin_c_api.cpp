#include "include/pro_plus/pro_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "pro_plus_plugin.h"

void ProPlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  pro_plus::ProPlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
