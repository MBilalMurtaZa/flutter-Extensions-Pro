import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pro_method_channel.dart';

abstract class ProPlatform extends PlatformInterface {
  /// Constructs a ProPlatform.
  ProPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProPlatform _instance = MethodChannelPro();

  /// The default instance of [ProPlatform] to use.
  ///
  /// Defaults to [MethodChannelPro].
  static ProPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProPlatform] when
  /// they register themselves.
  static set instance(ProPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
