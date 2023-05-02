

import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_request_dto.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/repository/cars/cars_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsCategoryController extends GetxController {
  // final selectedCategory = Get.arguments ;
  Rx<RangeValues> currentRangeFilterValues = const RangeValues(40, 80).obs;
  final loading = false.obs ;
  final catCars = <CarsResponse>[].obs ;
  final List res =Get.arguments;

  @override
  void onInit() {
    getCarsOfGroups();
    super.onInit();
  }

  getCarsOfGroups(){
    loading(true);
    final request = CarsRequest(groupId: res[0]);
    CarsRepository().getCarsOfGroup( request ,
        onComplete: ()=> loading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) => catCars.assignAll(data.data ?? [])
    );
  }

  void changeRangeValue(RangeValues values) {
    currentRangeFilterValues.value = values;
  }
}