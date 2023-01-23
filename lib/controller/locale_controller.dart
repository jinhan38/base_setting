import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 언어 타입 enum 클래스
enum LocaleList {
  ko("ko"), // 한국어
  en("en"); // 영어

  final String value;

  const LocaleList(this.value);
}

/// 언어 변경 컨트롤러
class LocaleController extends GetxController {
  static LocaleController get to => Get.find();

  String _currentLocale = "ko";

  /// 언어 변경
  void changeLocale({required String localeName}) {
    _currentLocale = localeName;
    Get.updateLocale(Locale(localeName, ""));
  }

  /// 앱 시작 언어 값 설정
  Locale defaultLocale() {
    final String defaultLocale = Platform.localeName;
    if (defaultLocale.contains("en")) {
      _currentLocale = LocaleList.en.value;
      return const Locale("en", "");
    }
    _currentLocale = LocaleList.ko.value;
    return const Locale("ko", "");
  }

  /// 현재 언어 확인
  String currentLocale() {
    return _currentLocale;
  }
}
