import 'package:get/get.dart';

import '../controllers/polman_controller.dart';

class PolmanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolmanController>(
      () => PolmanController(),
    );
  }
}
