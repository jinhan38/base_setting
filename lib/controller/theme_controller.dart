
import 'package:get/get.dart';

import '../util/custom_brightness.dart';
import '../util/custom_light_check.dart';
import '../util/custom_screen_mode.dart';
import 'base_controller.dart';


class ThemeController extends BaseController {
  static ThemeController get to => Get.find();

  /// 화면 밝기 조절
  final CustomBrightness customBrightness = CustomBrightness();

  /// 다크모드/기본 모드 설정
  final CustomScreenMode screenMode = CustomScreenMode();

  /// 조도 체크(기기 주변의 화면 밝기)
  final CustomLightCheck lightCheck = CustomLightCheck();
}
