



import 'package:get/get.dart';

import '../controllers/my_orders_detail_controller.dart';

class MyOrdersDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrdersDetailController>(() => MyOrdersDetailController());
  }

}