import 'package:get/get.dart';

import '../controllers/maintenance_checkout_controller.dart';

class MaintenanceCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaintenanceCheckoutController>(
      () => MaintenanceCheckoutController(),
    );
  }
}
