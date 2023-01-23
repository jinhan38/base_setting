import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

import 'base_util.dart';

/// 화면 밝기 변경, 화면 밝기 가져오는 클래스
class CustomBrightness extends BaseUtil {
  double brightness = 0;

  final key = "brightness";

  /// 기존에 입력해놓은 화면 밝기 값 가져오고 갱신
  Future<void> initBrightness() async {
    double? value = storage.read(key);
    value ??= await initPlatformBrightness();
    await changeBrightness(value);
  }

  /// 기기의 화면 밝기 값 가져오기
  Future<double> initPlatformBrightness() async {
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.0;
    }
    return bright;
  }

  /// 화면 밝기 값 변경
  Future<void> changeBrightness(double value) async {
    brightness = value;
    await storage.write(key, value);
    await FlutterScreenWake.setBrightness(value);
  }
}
