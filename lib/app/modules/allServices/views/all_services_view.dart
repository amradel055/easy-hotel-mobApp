import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/allServices/views/widgets/service_card.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/all_services_controller.dart';

class AllServicesView extends GetView<AllServicesController> {
  const AllServicesView({Key? key}) : super(key: key);

  // final String image;
  // final String name;
  // final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
          GestureDetector(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          // leadingWidth: 70.h,

          // backgroundColor: AppColors.backgroundColor,
          title: Row(
            children: [
              TextWidget(
                AppStrings.hello,
                size: 25.h,
                textColor: AppColors.appBlue,
                weight: FontWeight.bold,
              ),
              TextWidget(
                UserManager().user!.name!,
                size: 25.h,
                textColor: AppColors.appBlue,
                weight: FontWeight.bold,
              ),
            ],
          ),
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) =>
              [
                PopupMenuItem(
                  value: 1,
                  onTap: () async {
                    await UserManager().logout();
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      const Text(AppStrings.logout),
                      const Icon(Icons.logout, color: Colors.black,)
                    ],
                  ),
                ),
                // popupmenu item 2
              ],
              offset: const Offset(0, 50),
              color: AppColors.black,
              elevation: 2,
            ),
          ],
        ),
        body: Obx(() {
          if(controller.isLoading.value){
            return Center(
              child: Common.getSpin(),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(15.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: controller.appServicesList.length,
            itemBuilder: (context, index) {
              return ServiceCard(
                name: controller.appServicesList[index].applicationName!,
                image: controller.appServicesList[index].imgOut ?? "" ,
                appId: controller.appServicesList[index].applications! ,
                imageIn:controller.appServicesList[index].imgIn ?? "" ,
                 );
            },

          );
        }));
  }

}
