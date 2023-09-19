import 'package:easy_hotel/app/modules/cars/car_detail/controllers/car_details_controller.dart';
import 'package:easy_hotel/app/modules/halls/hall_detail/controllers/hall_details_controller.dart';
import 'package:easy_hotel/app/modules/hotel_detail/controllers/hotel_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:get/get.dart';


class HotelDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelDetailsController>(
      () => HotelDetailsController(),
    );
  }
}
