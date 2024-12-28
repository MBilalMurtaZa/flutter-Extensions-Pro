#ifndef FLUTTER_PLUGIN_PRO_PLUS_PLUGIN_H_
#define FLUTTER_PLUGIN_PRO_PLUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace pro_plus {

class ProPlusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ProPlusPlugin();

  virtual ~ProPlusPlugin();

  // Disallow copy and assign.
  ProPlusPlugin(const ProPlusPlugin&) = delete;
  ProPlusPlugin& operator=(const ProPlusPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace pro_plus

#endif  // FLUTTER_PLUGIN_PRO_PLUS_PLUGIN_H_
