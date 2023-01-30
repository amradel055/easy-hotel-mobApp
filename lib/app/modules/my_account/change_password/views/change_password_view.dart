import 'package:easy_hotel/app/components/button_widget.dart';
import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/utils/validator.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/change_password/controllers/change_password_controller.dart';
import 'package:easy_hotel/app/modules/my_account/mange_account/controllers/mange_account_controller.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    const space = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:
        GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const TextWidget(AppStrings.password),

        actions: [
          UnconstrainedBox(
            child: IconButtonWidget(
              icon:  Icons.notifications,
              onPressed: () {
                // FavProductsManager().addProduct(controller.room!, context);
              },
            ),
          ),
          const SizedBox(width: 10),
        ],      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: Common.getSpin(),
          );
        }
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.registerForm,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                   AppStrings.changePassword, size: 20, weight: FontWeight.bold,
                  ),
                  space,
                  TextFieldWidget(
                    controller: controller.oldPasswordController,
                    hint: AppStrings.oldPass,
                    suffixIcon: Icons.pin,
                    textInputAction: TextInputAction.next,
                    // onChange: (value) => controller.requestDto.name = value,

                    validator: AppValidator.forceValue,
                  ),
                  space,
                  TextFieldWidget(

                    controller: controller.newPasswordController,
                    // controller: controller.phoneController.text != ""?controller.phoneController:null,
                    // initialValue: UserManager().user!.phone??"",
                    hint:  AppStrings.newPass,
                    suffixIcon: Icons.password,
                    textInputAction: TextInputAction.next,
                    // onChange: (value) => controller.phoneController.text = value,

                    validator: AppValidator.forceValue,
                  ),


                  space,
                  TextFieldWidget(
                    controller: controller.confirmNewPasswordController,
                    // controller: controller.phoneController.text != ""?controller.phoneController:null,
                    // initialValue: UserManager().user!.phone??"",
                    hint: AppStrings.confirmNewPass,
                    suffixIcon: Icons.password,
                    textInputAction: TextInputAction.next,
                    // onChange: (value) => controller.phoneController.text = value,

                    validator: AppValidator.forceValue,
                  ),


                  space,
                  ButtonWidget(
                    text: AppStrings.confirm,
                    onPressed: ((controller.newPasswordController.text==controller.confirmNewPasswordController.text)
                        &&(controller.confirmNewPasswordController.text !="")&&
                        (controller.newPasswordController.text !="")&&
                        (controller.oldPasswordController.text !=""))? ()=> controller.editPassword():null,
                    expanded: true,
                    fontColor: Colors.white,
                    fontSize: size.height * .026,
                    buttonColor: AppColors.appHallsRedDark,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
          ),
        );
      })

      ,
    );
  }
}
