



import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/auth/login/dto/response/login_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/personal_info_edit_request.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MangeAccountController extends GetxController {
  var nameController = TextEditingController(text: UserManager().user!.name);
  var phoneController = TextEditingController(text: UserManager().user!.phone);
  final loading = false.obs;



  final registerForm = GlobalKey<FormState>();
  editPersonalInfo() {
    if(!registerForm.currentState!.validate()) return;
    loading(true);
    final request = EditPersonalInfoRequestDto(id: UserManager().user!.id!,name: nameController.text,phone: phoneController.text);
    SettingRepository().editPersonalInfo(request,
        onComplete: () => loading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          final user = UserManager().user!.toJson();
          user["name"] = nameController.text;
          user["phone"] = phoneController.text;
          UserManager().login(LoginResponse.fromJson(user));
          // phoneController.clear();
          // nameController.clear();
          Get.toNamed(Routes.MY_ACCOUNT);

        });
  }

}