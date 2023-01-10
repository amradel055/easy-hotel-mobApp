import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_save_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_save_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RoomReservationPageController extends GetxController {
  final RoomResponse room = Get.arguments;
   RxList selectedadditions=[].obs;
  final selectedAdd = <AddtionsModel>[].obs;
  final isLoading = false.obs;
  final totalPrice = 0.0.obs ;

  @override
  onInit(){
    calcTotalPrice();
    super.onInit();
  }

  getRoomSave() async {
    isLoading(true);
     SalesDetailRoomDTOModel sale=SalesDetailRoomDTOModel(
         roomId:room.id,
         leavingTime:DateTime.now(),
         arrivalTime: DateTime.now(),
         adaptNumber: 3,
         childrenNumber: 3,
         price: totalPrice.value,
         addtionsDtoList: selectedAdd,
         phone:UserManager().user!.phone!,
         email:UserManager().user!.email!,
         name: UserManager().user!.name!,
         purposeType: ""
     );


    final request = RoomsSaveRequest(
      companyId: AppConstants.companyId,
      createdBy: AppConstants.createdBy,
      branchId: 232,
      salesDetailRoomDTOModel:sale
    );
    RoomsRepository().getRoomSave(request,
        onSuccess: (data) {
          showPopupText( "تم الحفظ بنجاح");
          Get.toNamed(Routes.ALLSERVICES);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  changeAddedAdditions (AddtionsModel add){
    if(selectedAdd.toList().contains(add)){
      selectedAdd.remove(add);
    }else{
      selectedAdd.add(add);
    }
    calcTotalPrice();
  }

  calcTotalPrice(){
    totalPrice((room.price != null && room.price != 0 ? room.price : room.price)?.toDouble());
    selectedAdd.toList().forEach((addition) {
      totalPrice.value += (addition.salePrice != null && addition.salePrice != 0 ? addition.salePrice : addition.price)!.toDouble();
    });
  }

}
