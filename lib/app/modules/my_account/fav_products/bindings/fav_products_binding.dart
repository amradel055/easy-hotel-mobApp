



import 'package:get/get.dart';

import '../controllers/fav_products_controller.dart';

class FavProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavProductsController>(() => FavProductsController());
  }

}