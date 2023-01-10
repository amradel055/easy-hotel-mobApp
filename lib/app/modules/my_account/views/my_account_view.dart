
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/views/widgets/setting_tab_widget.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountView extends GetView<MyAccountView> {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.notifications),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(ApiProvider.imageUrl +  "image"),
                  radius: 33.00,
                ),
              ),
              TextWidget(UserManager().user?.name??"",weight: FontWeight.bold , size: 15,),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              TextWidget(AppStrings.mange,weight: FontWeight.bold , size: 20,),
              GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.ALLSERVICES);
                  },
                  child: SettingTabWidget(Icons.settings,AppStrings.setting,)),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              GestureDetector(onTap: (){
                Get.toNamed(Routes.SETTINGS);
              },child: SettingTabWidget(Icons.account_circle,AppStrings.mange)),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.book,AppStrings.terms),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.logout,AppStrings.logout),
              // Container(height: 2,width: size.width,color: AppColors.appGreyDark,),







            ],
          ),
        ),
      )
      ,
    );

  }
}
