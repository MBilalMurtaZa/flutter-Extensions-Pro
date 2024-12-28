import 'package:flutter_test/flutter_test.dart';
import 'package:pro_plus/pro_plus.dart';
import 'package:pro_plus/pro_plus_platform_interface.dart';
import 'package:pro_plus/pro_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockProPlusPlatform
    with MockPlatformInterfaceMixin
    implements ProPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ProPlusPlatform initialPlatform = ProPlusPlatform.instance;

  test('$MethodChannelProPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelProPlus>());
  });

  test('getPlatformVersion', () async {
    ProPlus proPlusPlugin = ProPlus();
    MockProPlusPlatform fakePlatform = MockProPlusPlatform();
    ProPlusPlatform.instance = fakePlatform;

    expect(await proPlusPlugin.getPlatformVersion(), '42');
  });
}
