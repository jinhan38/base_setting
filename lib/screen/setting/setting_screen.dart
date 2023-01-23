import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../controller/locale_controller.dart';
import '../../controller/theme_controller.dart';
import '../../util/device_info.dart';
import 'widgets/brightness_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final IconData _iconDark = Icons.nights_stay;
  final IconData _iconLight = Icons.wb_sunny;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        actions: [
          IconButton(
              onPressed: () {
                ThemeController.to.screenMode
                    .changeTheme(!ThemeController.to.screenMode.isLight.value);
              },
              icon: Icon(ThemeController.to.screenMode.isLight.value
                  ? _iconLight
                  : _iconDark)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("ElevatedButton")),
              TextButton(onPressed: () {}, child: const Text("TextButton")),
              const Text("Text"),

              /// 화면 밝기 조절 위젯
              const BrightnessWidget(),
              const SizedBox(height: 50),

              /// 언어 영어로 변경
              ElevatedButton(
                  onPressed: () {
                    LocaleController.to
                        .changeLocale(localeName: LocaleList.en.value);
                    setState(() {});
                  },
                  child: const Text("Change Locale en")),

              /// 언어 한글로 변경
              ElevatedButton(
                  onPressed: () {
                    LocaleController.to
                        .changeLocale(localeName: LocaleList.ko.value);
                    setState(() {});
                  },
                  child: const Text("Change Locale ko")),

              /// locale_string 파일에 저장해 놓은 값 불러오기
              Text("hello".tr),

              /// 조도 사용 여부 변경
              Obx(() {
                return ElevatedButton(
                    onPressed: () {
                      LocaleController.to
                          .changeLocale(localeName: LocaleList.ko.value);
                      setState(() {
                        ThemeController.to.lightCheck.changeEnable();
                      });
                    },
                    child: Text(
                        "조도 사용 : ${ThemeController.to.lightCheck.enable}"));
              }),

              /// 디바이스의 센서가 인식 하고 있는 조도의 값
              Obx(() {
                return Text(
                    "센서 밝기 : ${ThemeController.to.lightCheck.valueNotifier.value}");
              }),

              const SizedBox(height: 50),

              FutureBuilder<AndroidDeviceInfo>(
                  future: DeviceInfo().getInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        Text(
                            "기기 안드로이드 OS 버전 : ${snapshot.data!.version.release}"),
                        Text("모델 : ${snapshot.data!.model}"),
                      ],
                    );
                  }),
              FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const SizedBox();
                    }
                    return Text("앱 버전 : ${snapshot.data!.version}");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
