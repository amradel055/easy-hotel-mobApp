import 'package:get/get.dart';

import '../controllers/house_keeping_checkout_controller.dart';

class HouseKeepingCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseKeepingCheckoutController>(
      () => HouseKeepingCheckoutController(),
    );
  }
}
