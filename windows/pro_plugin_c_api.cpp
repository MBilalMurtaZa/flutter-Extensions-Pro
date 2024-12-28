#include "include/pro/pro_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "pro_plugin.h"

void ProPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  pro::ProPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
