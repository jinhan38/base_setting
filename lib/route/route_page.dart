import 'package:base_setting/screen/setting/setting_screen.dart';
import 'package:get/get.dart';

import '../controller/base_controller.dart';
import '../screen/main_screen/main_screen.dart';

class RoutePage {

  /// 화면이동
  static move(String pageName) => Get.toNamed(pageName);

  /// 화면 이동과 함께 데이터 전달
  static moveWithArgument(String pageName, dynamic arguments) =>
      Get.toNamed(pageName, arguments: arguments);

  /// Future로 화면 이동 후 데이터 받기
  static Future<dynamic> moveWithArgumentCallBack(
          String pageName, dynamic arguments) async =>
      Get.toNamed(pageName, arguments: arguments);

  ///현재 page 지우고 다음 페이지로 이동
  static offAndToNamed(String pageName, {dynamic argument}) =>
      Get.offAndToNamed(pageName, arguments: argument);

  ///기존에 쌓여있던 모든 stack 지우고 이동하려는 페이지만 stack이 남는다
  static moveOffAllNamed(String pageName) => Get.offAllNamed(pageName);

  ///현재 페이지 닫고, 다음 페이지로 argument 전달하면서 이동
  static offToNameWithArgument(String pageName, {dynamic argument}) =>
      Get.offAndToNamed(pageName, arguments: argument);

  ///현재 페이지 제거하고 입력받은 페이지로 이동
  static off(String pageName) => Get.off(pageName);

  static offAllNamed(String pageName) => Get.offAllNamed(pageName);

  static deleteController<T extends BaseController>() => Get.delete<T>();

  static getBack() => Get.back();

  // static goHome() =>
  //     Get.until((route) => Get.currentRoute == RoutePage.NAVIGATION_ROUTE);

  /// 특정 페이지까지 돌아가면서 다른 페이지 종료
  static offUntil(String routeName) =>
      Get.until((route) => Get.currentRoute == routeName);

  static const String mainScreen = "/main_screen";
  static const String settingScreen = "/setting_screen";

  static final List<GetPage> pageList = <GetPage>[
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
    ),
  ];
}
