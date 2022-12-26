import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_save_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:get/get.dart';

class HallReservationPageController extends GetxController {
  final HallsDetailResponse hall = Get.arguments;
  final selectedAdd = <AddtionsModel>[].obs;
  final totalPrice = 0.0.obs ;


  @override
  onInit(){
    calcTotalPrice();
    super.onInit();
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
    totalPrice((hall.salePrice != null && hall.salePrice != 0 ? hall.salePrice : hall.price)?.toDouble());
    selectedAdd.toList().forEach((addition) {
      totalPrice.value += (addition.salePrice != null && addition.salePrice != 0 ? addition.salePrice : addition.price)!.toDouble();
    });
  }

}
