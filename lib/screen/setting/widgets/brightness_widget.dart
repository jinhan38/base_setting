import 'package:flutter/material.dart';

import '../../../controller/theme_controller.dart';

class BrightnessWidget extends StatefulWidget {

  /// 화면 밝기 조절 위젯
  const BrightnessWidget({Key? key}) : super(key: key);

  @override
  State<BrightnessWidget> createState() => _BrightnessWidgetState();
}

class _BrightnessWidgetState extends State<BrightnessWidget> {
  int label = 0;

  String _setLabel(double value) => (value * 10).ceil().toString();

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      min: 0.1,
      max: 1,
      divisions: 9,
      label: _setLabel(ThemeController.to.customBrightness.brightness),
      thumbColor: Colors.cyan,
      activeColor: Colors.cyan,
      inactiveColor: Colors.cyan,
      value: ThemeController.to.customBrightness.brightness,
      onChanged: (value) {
        ThemeController.to.customBrightness.changeBrightness(value);
        setState(() {});
      },
    );
  }
}
