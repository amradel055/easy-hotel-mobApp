import 'package:get/get.dart';

import '../controllers/polman_checkout_controller.dart';

class PolmanCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolmanCheckoutController>(
      () => PolmanCheckoutController(),
    );
  }
}
