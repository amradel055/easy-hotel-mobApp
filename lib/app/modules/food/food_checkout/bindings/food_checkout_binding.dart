import 'package:get/get.dart';

import '../controllers/food_checkout_controller.dart';

class FoodCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodCheckoutController>(
      () => FoodCheckoutController(),
    );
  }
}
