



import 'package:get/get.dart';

import '../controllers/mange_account_controller.dart';

class MangeAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MangeAccountController>(() => MangeAccountController());
  }

}