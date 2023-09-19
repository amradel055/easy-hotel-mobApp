import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/request/maintenance_save_request.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/maintenance/dto/response/maintenance_detail_response.dart';
import '../../../../data/repository/maintenence/maintenence_repository.dart';

class MaintenanceCheckoutController extends GetxController {
  var nameController = TextEditingController(text: UserManager().user!.name ??"");
  var userNameController = TextEditingController(text:UserManager().user!.name ??"");
  var phoneController = TextEditingController(text: UserManager().user!.mobile ??"");
  var emailController = TextEditingController(text:UserManager().user!.email ??"");
  final registerForm = GlobalKey<FormState>();
  final isLoading = false.obs;
  final List res =Get.arguments;
  getMaintenanceSave() async {
    isLoading(true);
    final request = MaintenanceSaveRequest(
        branchId:res[7],
        createdBy:AppConstants.createdBy,
        companyId: AppConstants.companyId,
        customerId: UserManager().user!.id,
        maintenanceDTOList: res[8],
        dueDate: res[2],
        dueTime: res[2],
        remark: res[3],
        phone: phoneController.text,
        email: emailController.text,
        name: nameController.text,
    );
    MaintenanceRepository().getMaintenanceSave(request,
        onSuccess: (data) {
          showPopupText( AppStrings.savedSuccessfully);
          UserManager().sendNewOrderNotification(AppConstants.maintenance);
          Get.close(3);



        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

}
