import 'package:flutter_test/flutter_test.dart';
import 'package:pro/pro.dart';
import 'package:pro/pro_platform_interface.dart';
import 'package:pro/pro_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockProPlatform
    with MockPlatformInterfaceMixin
    implements ProPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ProPlatform initialPlatform = ProPlatform.instance;

  test('$MethodChannelPro is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPro>());
  });

  test('getPlatformVersion', () async {
    Pro proPlugin = Pro();
    MockProPlatform fakePlatform = MockProPlatform();
    ProPlatform.instance = fakePlatform;

    expect(await proPlugin.getPlatformVersion(), '42');
  });
}
