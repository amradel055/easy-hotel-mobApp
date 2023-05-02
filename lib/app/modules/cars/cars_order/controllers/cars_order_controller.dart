import 'package:easy_hotel/app.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_order_request.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_traffic_line_request_dto.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_traffic_lines_response.dart';
import 'package:easy_hotel/app/data/repository/cars/cars_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CarsOrderController extends GetxController {
  final CarsResponse selectedCar = Get.arguments;

  Rx<TextEditingController> timeController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  final selectedTravelType = 0.obs;

  final loading = false.obs;

  DateTime? selectedDate;

  final selectedPersonsNumber = 1.obs;

  final trafficLines = <CarsTrafficLinesResponse>[].obs;

  final selectedTrafficLine = Rxn<CarsTrafficLinesResponse>();
  var remark = TextEditingController();


  final travelTypes = [
    {"id": 0, "name":AppStrings.goingAndReturn},
    {"id": 1, "name": AppStrings.going},
    {"id": 2, "name": AppStrings.returning},
  ];

  @override
  onInit() {
    getTrafficLines();
    super.onInit();
  }

  getTrafficLines() {
    loading(true);
    final request = CarsTrafficLinesRequest(branchId: selectedCar.branchId!);
    CarsRepository().getAllTrafficLines(request,
        onComplete: () => loading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          trafficLines.assignAll(data.data ?? []);
          if (data.data?.isNotEmpty ?? false) {
            selectedTrafficLine(data.data![0]);
          }
        });
  }




  changeSelectedTrafficLines(CarsTrafficLinesResponse selected) {
    selectedTrafficLine(selected);
  }

  changeSelectedPersonNumber(int selected) {
    selectedPersonsNumber(selected);
  }

  changeSelectedType(int selected) {
    selectedTravelType(selected);
  }

  changeTime(TimeOfDay value) {
    timeController.value.text = "${value.hour}:${value.minute}";
  }

  changeDate(DateTime value) {
    dateController.value.text = "${value.toLocal()}".split(" ")[0];
    selectedDate = value;
  }
}
