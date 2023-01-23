import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/route_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("메인화면"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  RoutePage.move(RoutePage.settingScreen);
                },
                child: const Text("Setting screen")),
            TextButton(onPressed: () {}, child: const Text("TextButton")),
            const Text("Text"),
            Text("hello".tr),
          ],
        ),
      ),
    );
  }
}
