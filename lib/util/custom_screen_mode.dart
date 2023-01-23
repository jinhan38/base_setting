import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/app_color.dart';
import 'base_util.dart';

class CustomScreenMode extends BaseUtil {
  final key = "isLight";

  RxBool isLight = true.obs;

  /// 기본 모드 테마
  final ThemeData _lightTheme = ThemeData(
    primarySwatch: AppColor.mainColorLight,
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.buttonColorLight,
    ),
  );

  /// 다크 모드 테마
  final ThemeData _darkTheme = ThemeData(
    primarySwatch: AppColor.mainColorDark,
    brightness: Brightness.dark,
  );

  /// 현재 설정된 모드 테마 가져오기
  ThemeData getThemeData(bool isLight) {
    return isLight ? _lightTheme : _darkTheme;
  }

  /// 기존에 입력해 놓은 테마 변수 가져오기
  Future<void> initTheme() async {
    bool? value = storage.read(key);
    value ??= isLight.value;
    await changeTheme(value);
  }

  /// 테마 변경
  Future<void> changeTheme(bool value) async {
    isLight.value = value;
    await storage.write(key, value);
  }
}
