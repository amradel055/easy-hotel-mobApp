import 'package:easy_hotel/app/components/button_widget.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/validator.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const space = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: AppColors.appBlue,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40.00))),
                  margin: EdgeInsets.only(top: 10.h),
                  child: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios,color:Colors.white ,size: size.height*.12,),),),
              Padding(
                padding:  EdgeInsets.only(top: 40.h),
                child: TextWidget(AppStrings.resetPassword,textColor: Colors.white,weight:FontWeight.bold,size: size.height*.05,),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),color: Colors.white),
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: controller.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        controller:controller.emailController,
                        label: AppStrings.email,
                        suffixIcon: Icons.email,
                        textInputAction: TextInputAction.next,
                        ltr: true,
                        onChange: (value) => controller.requestDto.email = value,
                        validator: AppValidator.forceValue,
                      ),
                      space,
                      ButtonWidget(
                        text: AppStrings.resetPassword,
                        onPressed: () => controller.reset(),
                        expanded: true,
                        fontColor: Colors.white,
                        fontSize: size.height*.026,
                        buttonColor: Theme.of(context).primaryColor,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
