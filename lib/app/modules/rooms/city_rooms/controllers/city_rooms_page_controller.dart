import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/all_additions_halls__request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_search_filter_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_search_city_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:get/get.dart';

class CityRoomsPageController extends GetxController {

  final roomsCity = <RoomcityResponse>[].obs;
  final isLoading = false.obs;
  final selectedAdd = <AddtionsModel>[].obs;
  final allAdditions = <AdditionsGroupModel>[].obs;
  final List args = Get.arguments;



  @override
  void onInit() {
    super.onInit();
    getRoomsCity();


  }

  getRoomsCity() async {
    isLoading(true);
    final request = RoomSearchFilterRequest(
      hotelId: null,
      cityId: args[0],
      childrenNumber: args[1],
      adaptNumber: args[2]

    );
    RoomsRepository().getCityRooms(request,
        onSuccess: (data) {
          roomsCity.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  // getAllAdditions() async {
  //   isLoading(true);
  //   final request = AllAdditionsHallsRequest(
  //     appId: 6,
  //
  //   );
  //   HallsRepository().getAllAdditionsHalls(request,
  //       onSuccess: (data) {
  //         allAdditions.assignAll(data.data);
  //       },
  //       onError: (e) => showPopupText( e.toString()),
  //       onComplete: () => isLoading(false)
  //   );
  // }

}
