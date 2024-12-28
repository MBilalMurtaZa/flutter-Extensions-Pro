export 'build_context_extensions.dart';
export 'color_extensions.dart';
export 'datetime_extensions.dart';
export 'list_extensions.dart';
export 'other_extensions.dart';
export 'string_extensions.dart';
export 'widget_extensions.dart';
import 'pro_plus_platform_interface.dart';

class ProPlus {
  Future<String?> getPlatformVersion() {
    return ProPlusPlatform.instance.getPlatformVersion();
  }
}
