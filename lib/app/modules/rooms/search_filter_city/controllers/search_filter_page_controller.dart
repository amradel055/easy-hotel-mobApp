import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/all_additions_halls__request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSearchFilterCityPageController extends GetxController {

  final int id = Get.arguments;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedDatetwo = DateTime.now().obs;
  final RxInt children=0.obs;
  final RxInt adults=0.obs;
  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate.value)
      selectedDate.value = selected;
  }
  selectEndDate(BuildContext context) async {
    final DateTime? selectedEnd = await showDatePicker(
      context: context,
      initialDate: selectedDatetwo.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selectedEnd != null && selectedEnd != selectedDatetwo.value)
      selectedDatetwo.value = selectedEnd;
  }



  @override
  void onInit() {
    super.onInit();


  }

}
