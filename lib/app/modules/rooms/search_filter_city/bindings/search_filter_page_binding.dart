import 'package:get/get.dart';

import '../controllers/search_filter_page_controller.dart';

class RoomSearchCityFilterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomSearchFilterCityPageController>(
          () => RoomSearchFilterCityPageController(),
    );
  }
}
