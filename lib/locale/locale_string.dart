import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko': {
          'hello': '헬로 월드',
        },
        'en': {
          'hello': 'Hello world',
        },
      };
}
