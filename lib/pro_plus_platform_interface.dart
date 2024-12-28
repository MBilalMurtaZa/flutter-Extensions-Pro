import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pro_plus_method_channel.dart';

abstract class ProPlusPlatform extends PlatformInterface {
  /// Constructs a ProPlusPlatform.
  ProPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static ProPlusPlatform _instance = MethodChannelProPlus();

  /// The default instance of [ProPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelProPlus].
  static ProPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ProPlusPlatform] when
  /// they register themselves.
  static set instance(ProPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
