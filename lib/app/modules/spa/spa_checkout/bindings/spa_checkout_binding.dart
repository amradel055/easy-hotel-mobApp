import 'package:get/get.dart';

import '../controllers/spa_checkout_controller.dart';

class SpaCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpaCheckoutController>(
      () => SpaCheckoutController(),
    );
  }
}
