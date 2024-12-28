import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pro_plus_platform_interface.dart';

/// An implementation of [ProPlusPlatform] that uses method channels.
class MethodChannelProPlus extends ProPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pro_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
