
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/views/widgets/setting_tab_widget.dart';
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
        leading: Icon(Icons.add),
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
              TextWidget("namenamenamenamename",weight: FontWeight.bold , size: 15,),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              TextWidget("M",weight: FontWeight.bold , size: 20,),
              SettingTabWidget(Icons.edit,"setting"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.edit,"profile"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.edit,"change password"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.edit,"terms"),
              TextWidget("Language",weight: FontWeight.bold , size: 20,),
              SettingTabWidget(Icons.edit,"Language"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              TextWidget("Mode",weight: FontWeight.bold , size: 20,),
              SettingTabWidget(Icons.edit,"mode"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.logout,"Logout"),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),







            ],
          ),
        ),
      )
      ,
    );

  }
}
