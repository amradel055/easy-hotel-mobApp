import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_detail_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:get/get.dart';

class RoomDetailController extends GetxController {

  final int id = Get.arguments;
  RxInt  index = 1.obs;
  RxInt  serviceIndex = 0.obs;
  RxInt selectedType = 1.obs;
  RoomResponse? room ;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;



  @override
  void onInit() {
    super.onInit();
    getRoomDetail();


  }


  getRoomDetail() async {
    isLoading(true);
    final request = RoomDetailRequest(
      id:id ,

    );
    RoomsRepository().getRoomDetail(request,
        onSuccess: (data) {
          room=data.data;

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }



}
