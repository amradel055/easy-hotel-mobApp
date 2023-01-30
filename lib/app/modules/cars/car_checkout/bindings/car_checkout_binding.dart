import 'package:get/get.dart';

import '../controllers/car_checkout_controller.dart';

class CarCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarCheckoutController>(
      () => CarCheckoutController(),
    );
  }
}
