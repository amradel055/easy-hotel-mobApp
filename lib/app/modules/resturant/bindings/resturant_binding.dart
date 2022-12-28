import 'package:get/get.dart';

import '../controllers/resturant_controller.dart';

class ResturantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(
      () => RestaurantController(),
    );
  }
}
