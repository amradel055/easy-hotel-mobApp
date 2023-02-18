import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/all_additions_halls__request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_search_filter_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_search_city_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/halls/dto/response/halls_response.dart';


class HotelRoomsPageController extends GetxController {
  final roomsHotel = <RoomcityResponse>[].obs;
  final isLoading = false.obs;
  final selectedAdd = <AddtionsModel>[].obs;
  final allAdditions = <AdditionsGroupModel>[].obs;
  final List args = Get.arguments;
  final selectedStarsNumber = 1.obs;
  RangeValues currentRangeValues = const RangeValues(0, 10000);
  late double from=0.0.obs();
  late double to=10000.0.obs();



  @override
  void onInit() {
    super.onInit();
    getRoomsHotel();
    getAllAdditions();



  }

  getRoomsHotel() async {
    isLoading(true);
    final request = RoomSearchFilterRequest(
        hotelId: args[0],
        cityId: null,
        childrenNumber: args[1],
        adaptNumber: args[2],
        arrivalTime:args[3],
        leavingTime:args[4]

    );
    RoomsRepository().getCityRooms(request,
        onSuccess: (data) {
          roomsHotel.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  getAllAdditions() async {
    isLoading(true);
    final request = AllAdditionsHallsRequest(
      appId: 7,

    );
    HallsRepository().getAllAdditionsHalls(request,
        onSuccess: (data) {
          allAdditions.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  changeSelectedStarsNumber(int selected) {
    selectedStarsNumber(selected);
  }
}
