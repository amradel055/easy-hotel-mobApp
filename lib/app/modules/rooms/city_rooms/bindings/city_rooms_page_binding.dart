import 'package:get/get.dart';

import '../controllers/city_rooms_page_controller.dart';

class CityRoomsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CityRoomsPageController>(
          () => CityRoomsPageController(),
    );
  }
}
