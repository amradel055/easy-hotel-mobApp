import 'package:easy_hotel/app/modules/hotels_search/controller/hotel_search_controller.dart';
import 'package:easy_hotel/app/modules/hotels_search/views/hotel_search_home_view.dart';
import 'package:easy_hotel/app/modules/my_account/acoount_homepage/controllers/my_account_controller.dart';
import 'package:easy_hotel/app/modules/my_account/acoount_homepage/views/my_account_view.dart';
import 'package:easy_hotel/app/modules/rooms/rooms_homepage/controllers/rooms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../rooms/rooms_homepage/views/rooms_view.dart';


class HomeController extends GetxController {

  final pageIndex = 0.obs;
  List<Widget> pages = const[
    // RoomsView(),
    HotelSearchView(),
    MyAccountView(),
  ];

  @override
  void onInit() {
    Get.isRegistered<HotelSearchController>() ? Get.find<HotelSearchController>() : Get.put(HotelSearchController());
    Get.isRegistered<MyAccountController>() ? Get.find<MyAccountController>() : Get.put(MyAccountController());
    // Get.isRegistered<RoomsController>() ? Get.find<RoomsController>() : Get.put(RoomsController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void changeView(int index) => pageIndex.value = index;
}
