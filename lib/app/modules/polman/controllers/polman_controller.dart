import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/polman/dto/request/polman_save_request.dart';
import 'package:easy_hotel/app/data/repository/polman/polman_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PolmanController extends GetxController {
  final isLoading = false.obs;
  Rx<DateTime> dateTime =DateTime.now().obs;
  final List res =Get.arguments;
  var remark = TextEditingController();




  getpolmanSave() async {
    isLoading(true);
    final request = PolmanSaveRequest(
      remark: remark.text,
      serviceTypeId:res[1] ,
      branchId: UserManager().selectedBranch!.id!,
      createdBy:AppConstants.createdBy,
      companyId: AppConstants.companyId,
      customerId: UserManager().user!.id,
      time: dateTime.value
    );
    PolmanRepository().getPolmanSave(request,
        onSuccess: (data) {
          showPopupText( "تم الحفظ بنجاح");
          Get.toNamed(Routes.ALLSERVICES);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
}
