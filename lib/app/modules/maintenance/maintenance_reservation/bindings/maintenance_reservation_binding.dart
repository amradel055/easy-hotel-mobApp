import 'package:get/get.dart';

import '../controllers/maintenance_reservation_controller.dart';

class MaintenanceReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaintenanceReservationController>(
      () => MaintenanceReservationController(),
    );
  }
}
