import 'package:get/get.dart';

import '../controllers/room_checkout_controller.dart';

class RoomCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomCheckoutController>(
      () => RoomCheckoutController(),
    );
  }
}
