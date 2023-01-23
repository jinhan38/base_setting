import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/base_controller.dart';
import 'controller/locale_controller.dart';
import 'controller/theme_controller.dart';
import 'locale/locale_string.dart';
import 'route/route_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(BaseController(), permanent: true);
  Get.put(LocaleController(), permanent: true);
  Get.put(ThemeController(), permanent: true);
  await ThemeController.to.screenMode.initTheme();
  await ThemeController.to.customBrightness.initBrightness();
  await ThemeController.to.lightCheck.initPlatformState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Flutter base setting',
        theme: ThemeController.to.screenMode
            .getThemeData(ThemeController.to.screenMode.isLight.value),
        translations: LocaleString(),
        locale: LocaleController.to.defaultLocale(),
        initialRoute: RoutePage.mainScreen,
        getPages: RoutePage.pageList,
      );
    });
  }
}
