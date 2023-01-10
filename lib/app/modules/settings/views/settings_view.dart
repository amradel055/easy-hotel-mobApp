
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/views/widgets/setting_tab_widget.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends GetView<SettingsView> {
  const SettingsView({Key? key}) : super(key: key);

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

              TextWidget(AppStrings.mange,weight: FontWeight.bold , size: 20,),
              SettingTabWidget(Icons.language,AppStrings.language,),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.attach_money,AppStrings.currency),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              SettingTabWidget(Icons.light_mode,AppStrings.mode),
              Container(height: 2,width: size.width,color: AppColors.appGreyDark,),
              // Container(height: 2,width: size.width,color: AppColors.appGreyDark,),







            ],
          ),
        ),
      )
      ,
    );

  }
}
