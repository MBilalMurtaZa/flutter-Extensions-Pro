import 'pro_platform_interface.dart';
export 'build_context_extensions.dart';
export 'color_extensions.dart';
export 'datetime_extensions.dart';
export 'list_extensions.dart';
export 'other_extensions.dart';
export 'string_extensions.dart';
export 'widget_extensions.dart';

class Pro {
  Future<String?> getPlatformVersion() {
    return ProPlatform.instance.getPlatformVersion();
  }
}
