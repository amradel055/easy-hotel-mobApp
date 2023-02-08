import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/repository/spa/spa_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpaDetailsController extends GetxController {

  int? id = Get.arguments;
  RxInt  index = 1.obs;
  RxInt  serviceIndex = 2.obs;
  RxInt selectedType = 1.obs;
  SpaResponse? spa ;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final servicesSelectedNames = <String>[].obs;
  final servicesSelectedPrices = <String>[].obs;
  final totalPrice = 0.0.obs ;
  final selectedAdd = <SpaItemModel>[].obs;

  Rx<TextEditingController> timeController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  DateTime? selectedDate;





  @override
  void onInit() {
     if(id != null){
       getSpaDetailById();
     }else{
       getSpaDetailByHotel();
     }
     calcTotalPrice();
     super.onInit();
  }

  getSpaDetailById() async {
    isLoading(true);
    final request = SpaDetailRequest(
      id: id ,
    );
    SpaRepository().getSpaDetail(request,
        onSuccess: (data) {
          spa=data.data;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }


  getSpaDetailByHotel() async {
    isLoading(true);
    final request = SpaDetailRequest(
      branchId: UserManager().selectedBranch?.id ,
    );
    SpaRepository().getSpaDetailByHotel(request,
        onSuccess: (data) {
          spa = data.data;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }



   getOfferItems(int offerItemId,RxInt index){
     if(!servicesSelected.toList().contains(offerItemId)){
       servicesSelected.add(offerItemId);
       servicesSelectedNames.add(spa!.spaItemsDtoList![index.value].name!);
       servicesSelectedPrices.add( spa!.spaItemsDtoList![index.value].salePrice == null?spa!.spaItemsDtoList![index.value].price!.toString():spa!.spaItemsDtoList![index.value].salePrice.toString());
       changeAddedAdditions(spa!.spaItemsDtoList![index.value]);
     }
   }

  changeAddedAdditions (SpaItemModel add){
    if(selectedAdd.toList().contains(add)){
      selectedAdd.remove(add);
    }else{
      selectedAdd.add(add);
    }
    calcTotalPrice();
  }


  calcTotalPrice(){
    totalPrice((0).toDouble());
    selectedAdd.toList().forEach((addition) {
      totalPrice.value += (addition.salePrice != null && addition.salePrice != 0 ? addition.salePrice : addition.price)!.toDouble();
    });
  }

  changeTime(TimeOfDay value) {
    value.hour<=10&&value.minute<=10?timeController.value.text ="0${value.hour}:0${value.minute}":
    value.hour<=10&&value.minute>=10?timeController.value.text ="0${value.hour}:${value.minute}":
    value.hour>=10&&value.minute<=10?timeController.value.text ="${value.hour}:0${value.minute}":
    timeController.value.text = "${value.hour}:${value.minute}";
  }

  changeDate(DateTime value) {
    dateController.value.text = "${value.toLocal()}".split(" ")[0];
    selectedDate = value;
  }

}
