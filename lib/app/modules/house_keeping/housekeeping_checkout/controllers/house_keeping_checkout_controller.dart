import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_save_request.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class HouseKeepingCheckoutController extends GetxController {
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final registerForm = GlobalKey<FormState>();
  final isLoading = false.obs;
  final List res =Get.arguments;
  getHousekeepingSave() async {
    isLoading(true);
    final request = HousekeepingSaveRequest(
        branchId:res[7],
        createdBy:AppConstants.createdBy,
        companyId: AppConstants.companyId,
        customerId: UserManager().user!.id,
        houseKeepingDTOList: res[8],
        dueDate: res[1],
        dueTime: res[2],
        remark: res[3],
        name: "",
        email: "",
        phone: ""
    );
    HousekeepingRepository().getHousekeepingSave(request,
        onSuccess: (data) {
          showPopupText( AppStrings.savedSuccessfully);
          Get.toNamed(Routes.ALLSERVICES);

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

}
