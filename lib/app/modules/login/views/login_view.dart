import 'package:easy_hotel/app/components/button_widget.dart';
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/validator.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    const space = SizedBox(height: 20);

    return Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(() {
          if(controller.isLoading.value){
            return Center(
              child: Common.getSpin(),
            );
          }
          return Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 40.h),
                    child: ImageWidget(
                      path: AppAssets.logoImg, width: 100, height: 110,),),
                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: TextWidget(
                      AppStrings.Welcome, textColor: AppColors.appHallsRedDark,
                      weight: FontWeight.bold,
                      size: size.height * .05,),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.loginForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFieldWidget(
                            controller: controller.userNameController,
                            label: AppStrings.userName,
                            suffixIcon: Icons.account_circle,
                            onChange: (value) =>
                            controller.requestDto.userName = value,
                            ltr: true,
                            validator: AppValidator.forceValue,
                            textInputAction: TextInputAction.next,
                          ),
                          space,
                          Obx(() =>
                              TextFieldWidget(
                                controller: controller.passwordController,
                                label: AppStrings.password,
                                obscure: !controller.showPassword.value,
                                suffixIcon: !controller.showPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onChange: (value) =>
                                controller.requestDto.password = value,
                                onSuffixClicked: () =>
                                    controller.changePasswordVisibility(),
                                ltr: true,
                                validator: AppValidator.forceValue,
                              )),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(Routes.FORGET_PASSWORD),
                                    child: const TextWidget(
                                      AppStrings.forgetYourPassword,
                                      textColor: Colors.red,)),
                              ],
                            ),
                          ),
                          space,
                          ButtonWidget(
                            text: AppStrings.login,
                            onPressed: () => controller.login(),
                            expanded: true,
                            fontColor: Colors.white,
                            fontSize: size.height * .026,
                            buttonColor: Theme
                                .of(context)
                                .primaryColor,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Row(
                                children: [
                                  const TextWidget(AppStrings.haveAccount),
                                  GestureDetector(
                                      onTap: () => Get.toNamed(Routes.REGISTER),
                                      child: const TextWidget(
                                        AppStrings.register,
                                        textColor: Colors.red,))
                                ]


                            ),
                          )


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        })
    );
  }
}
