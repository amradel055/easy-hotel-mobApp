



import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/personal_info_edit_request.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeEmailController extends GetxController {
  var emailController = TextEditingController();
  var keyController = TextEditingController();
  final loading = false.obs;



  final registerForm = GlobalKey<FormState>();
  editPersonalInfo() {
    if(!registerForm.currentState!.validate()) return;
    loading(true);
    final request = EditPersonalInfoRequestDto(id: UserManager().user!.id!,name: "",phone:"");
    SettingRepository().editPersonalInfo(request,
        onComplete: () => loading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          // UserManager().user!.name=nameController.text;
          // UserManager().user!.phone=phoneController.text;
          print(UserManager().user!.name);
          print(UserManager().user!.phone);
          Get.toNamed(Routes.MY_ACCOUNT);
          // city.assignAll(data.data);
          // if (data.data.isNotEmpty) {
          //   selectedCity(data.data[0]);
          //
          // }
        });
  }

}