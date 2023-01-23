
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  final GetStorage storage = GetStorage();

}
