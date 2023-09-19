import 'package:get/get.dart';

import '../controllers/maintenance_services_controller.dart';

class MaintenanceServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaintenanceServicesController>(
      () => MaintenanceServicesController(),
    );
  }
}
