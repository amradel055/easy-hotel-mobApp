import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/halls/halls_homepage/views/widgets/halls.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_home_page/views/widgets/Service.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/halls_controller.dart';

class HallsView extends GetView<HallsController> {
  const HallsView({Key? key}) : super(key: key);

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
          title: TextWidget(AppStrings.halls, size: 30.h,textColor: Colors.white,),
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
              height: 300.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://www.arabiaweddings.com/sites/default/files/articles/2020/02/wedding_venues_in_amman.png"),
                      fit: BoxFit.cover)),

              padding: EdgeInsets.fromLTRB(0, 175.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: TextWidget(
                    AppStrings.hallsSearchLabel, textColor: Colors.white,
                    size: 20.h,
                    weight: FontWeight.bold,)),
                  Center(
                    child: SizedBox(
                        width: size.width * .8,
                        child: TextFieldWidget(
                          enabled: false,
                          suffixIcon: Icons.search,
                          ltr: true,
                          hint: AppStrings.search,
                          onTap: () {
                            Get.toNamed(Routes.HALLS_SEARCH);
                          },
                        )
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if(controller.isLoading.value){
                return Center(
                  child: Common.getSpin(),
                );
              }
              return Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 20.h),
                          child: TextWidget(
                            AppStrings.hotelHalls, textAlign: TextAlign.left,
                            weight: FontWeight.w800,
                            size: 22.h,),
                        ),
                        SizedBox(
                            height: size.height * .18,
                            child:
                            ListView.builder(
                              itemCount: controller.allHalls.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Halls(
                                  image: controller.allHalls[index].image,
                                  name: controller.allHalls[index].name!,
                                  id: controller.allHalls[index].id!,
                                 );
                              },

                            )
                        ),
                        controller.offersHalls.isNotEmpty?   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 20.h),
                              child: TextWidget(
                                AppStrings.offers, textAlign: TextAlign.left,
                                weight: FontWeight.w800,
                                size: 22.h,),
                            ),
                            SizedBox(
                                height: size.height * .23,
                                child:
                                ListView.builder(
                                  itemCount: controller.offersHalls.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Halls(
                                      image: controller.offersHalls[index].image,
                                      name: controller.offersHalls[index].name!,
                                      id: controller.offersHalls[index].id!,
                                    );
                                  },

                                )
                            ),
                          ],
                        ): const SizedBox(),

                      ]),
                ),
              );
            })
          ],
        )
    );
  }
}
