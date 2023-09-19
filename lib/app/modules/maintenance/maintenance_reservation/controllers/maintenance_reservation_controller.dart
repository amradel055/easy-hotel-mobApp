import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../../data/model/maintenance/dto/request/maintenance_save_request.dart';
import '../../../../data/repository/maintenence/maintenence_repository.dart';

class MaintenanceReservationController extends GetxController {
  final isLoading = false.obs;
  final List res =Get.arguments;
   Rx<DateTime> dateTime =DateTime.now().obs;
  final Rxn<DateTime> dateTo = Rxn();
  var remark = TextEditingController();




  getMaintenanceSaveNow() async {
    isLoading(true);
    final request = MaintenanceSaveRequest(
        // serviceTypeId:res[0] ,
        branchId:res[4],
        createdBy:AppConstants.createdBy,
        companyId: AppConstants.companyId,
        customerId: UserManager().user!.id,
        maintenanceDTOList: res[7],
        dueTime: DateTime.now(),
        dueDate: DateTime.now(),
        remark: remark.text
    );
    MaintenanceRepository().getMaintenanceSave(request,
        onSuccess: (data) {
          showPopupText( "تم الحفظ بنجاح");
          Get.toNamed(Routes.ALLSERVICES);

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

  pickToDate() async {
    dateTo(await _pickDate(initialDate: dateTo.value ?? DateTime.now(), firstDate: dateTo.value ?? DateTime.now(), lastDate:  DateTime.utc(2030, 3, 14)));
  }
  _pickDate({required DateTime initialDate, required DateTime firstDate, required DateTime lastDate}) {
    return showDatePicker(context: Get.overlayContext!, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate);
  }
}
