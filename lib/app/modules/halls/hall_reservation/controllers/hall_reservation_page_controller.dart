import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_save_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HallReservationPageController extends GetxController {
  // final HallsDetailResponse hall = Get.arguments;
  final List args = Get.arguments;
  final isLoading = false.obs;
  final checkValue = false.obs;


  final selectedAdd = <AddtionsModel>[].obs;


  final totalPrice = 0.0.obs ;
  var remark = TextEditingController() ;

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
    totalPrice((args[0].salePrice != null && args[0].salePrice != 0 ? args[0].salePrice : args[0].price)?.toDouble());
    selectedAdd.toList().forEach((addition) {
      totalPrice.value += (addition.salePrice != null && addition.salePrice != 0 ? addition.salePrice : addition.price)!.toDouble();
    });
       final  sel=    args[1].toList();
       totalPrice.value=totalPrice.value*sel.length;
       // sel.length;

  }
  getHallSave() async {
    isLoading(true);
    if(args[1].toList().isEmpty){
      showPopupText(AppStrings.shouldSelectDays.tr);
      return ;
    }
    final request = HallsSaveRequest(
        currencySerial: 1,
        hallId: args[0].id,
        addtionsDTOList: selectedAdd.value,
        companyId: AppConstants.companyId,
        createdBy: AppConstants.createdBy,
        customerId: UserManager().user!.id,
        branchId: args[0].branchId,
        remark : remark.text,
        holePeriodIdList: args[1]
    );
    HallsRepository().getHallSave(request,
        onSuccess: (data) {
          showPopupText(data.msg);
          UserManager().sendNewOrderNotification(AppConstants.halls);
          // Get.offNamed(Routes.HALLS , arguments: args[0].branchId);
          Get.close(4);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

}
