import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_home_page/views/widgets/Service.dart';
import 'package:easy_hotel/app/modules/spa/spa_home/views/widgets/Service.dart';
import 'package:easy_hotel/app/modules/spa/spa_home/views/widgets/offer.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/house_keeping_controller.dart';

class HouseKeepingView extends GetView<HouseKeepingController> {
  const HouseKeepingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: TextWidget(AppStrings.home, size: 30.h,textColor: Colors.white,),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.black87,
                      Colors.black.withOpacity(.7),
                      Colors.black.withOpacity(.6),
                      Colors.transparent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 200.h,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        controller.res[0]
                      ),
                      fit: BoxFit.fitWidth)),

              padding: EdgeInsets.fromLTRB(0, 75.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Center(child: TextWidget(
                  //   AppStrings.searchlabel, textColor: Colors.white,
                  //   size: 20.h,
                  //   weight: FontWeight.bold,)),
                  // Center(
                  //   child: SizedBox(
                  //       width: size.width * .8,
                  //       child: TextFieldWidget(
                  //         label: AppStrings.search,
                  //         suffixIcon: Icons.search,
                  //         onChange: (value) {
                  //           controller.filter(value);
                  //         },
                  //
                  //         ltr: true,
                  //       )
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 10.h),
                      child: TextWidget(
                        AppStrings.searchlabel, textAlign: TextAlign.left,
                        weight: FontWeight.bold,
                        size: 20.h,),
                    ),
                    Obx(() {
                      if(controller.isLoading.value){
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return Expanded(
                          child:
                          GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20.h,
                              crossAxisSpacing: 20.w,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            itemCount: controller.housekeepingGroup.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return HousekeepingServicesWidget(
                                  controller.housekeepingGroup[index]
                                      .img ?? "",
                                 controller.housekeepingGroup[index]
                                    .name!,controller.housekeepingGroup[index]
                                  .id!,index,controller.housekeepingGroup[index]
                                  .branchId ==null?UserManager().selectedBranch!.id!:controller.housekeepingGroup[index]
                                  .branchId!);
                            },

                          )
                      );
                    }),
                  ]),
            )
          ],
        )
    );
  }
}
