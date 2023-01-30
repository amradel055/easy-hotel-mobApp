



import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/password_edit_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/personal_info_edit_request.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  final loading = false.obs;



  final registerForm = GlobalKey<FormState>();
  editPassword() {
    if(!registerForm.currentState!.validate()) return;
    loading(true);
    final request = EditPaswordRequestDto(id: UserManager().user!.id!,password:newPasswordController.text,oldPassword: oldPasswordController.text);
    SettingRepository().editPassword(request,
        onComplete: () => loading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          oldPasswordController.clear();
          newPasswordController.clear();
          confirmNewPasswordController.clear();

          UserManager().logout();

        });
  }

}