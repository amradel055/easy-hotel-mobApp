import 'package:get/get.dart';

import '../controllers/room_reservation_page_controller.dart';

class RoomReservationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomReservationPageController>(
          () => RoomReservationPageController(),
    );
  }
}
