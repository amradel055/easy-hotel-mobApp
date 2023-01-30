import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_home/controllers/spa_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_home/views/widgets/Service.dart';
import 'package:easy_hotel/app/modules/spa/spa_home/views/widgets/offer.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class SpaView extends GetView<SpaController> {
  const SpaView({Key? key}) : super(key: key);

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
          title: TextWidget(AppStrings.spas, size: 30.h,textColor: Colors.white,),
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
        body: Obx(() {
          if(controller.isLoading.value){
            return Center(
              child: Common.getSpin(),
            );
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 300.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.salon), fit: BoxFit.cover)),
                padding: EdgeInsets.fromLTRB(
                    size.width * .1, 175.h, size.width * .1, 0),
                child: Column(
                  children: [
                    Center(
                        child: TextWidget(
                          AppStrings.searchlabel, textColor: Colors.white,
                          size: 20.h,
                          weight: FontWeight.bold,)),
                    Row(
                      children: [
                        SizedBox(
                            width: size.width * .8,
                            child:
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SPASEARCHPAGE);
                              },
                              child: TextFieldWidget(
                                enabled: false,
                                hint: AppStrings.search,
                                suffixIcon: Icons.search,
                                ltr: true,
                                onTap: () {
                                  Get.toNamed(Routes.SPASEARCHPAGE);
                                },

                              ),
                            )


                        ),

                      ],
                    )
                  ],
                ),


              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 10.h),
                    //   child: TextWidget(
                    //     AppStrings.searchlabel, textAlign: TextAlign.left,
                    //     weight: FontWeight.bold,
                    //     size: 20.h,),
                    // ),
                    // Obx(() {
                    //   return SizedBox(
                    //       height: size.height * .17,
                    //       child:
                    //       GridView.builder(
                    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 1,
                    //           mainAxisSpacing: 0,
                    //           crossAxisSpacing: 0,
                    //         ),
                    //         itemCount: controller.spaGroup.length,
                    //         scrollDirection: Axis.horizontal,
                    //         itemBuilder: (context, index) {
                    //           return SpaServicesWidget(name: controller
                    //               .spaGroup[index].name!, city: controller
                    //               .spaGroup[index].cityName!,
                    //                onTap: (){}, id: controller
                    //                 .spaGroup[index].id!,
                    //           );
                    //         },
                    //
                    //       )
                    //   );
                    // }),
                   controller.spaOffer == []?const SizedBox(): Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                          child: TextWidget(
                            AppStrings.offers, textAlign: TextAlign.left,
                            weight: FontWeight.bold,
                            size: 20.h,),
                        ),
                        Obx(() {
                          return SizedBox(
                              height: size.height * .34,
                              child:
                              ListView.builder(
                                itemCount: controller.spaOffer.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SpaOffersWidgets(
                                    image: controller.spaOffer[index].image??AppAssets.placeHolderImg,
                                    name: controller.spaOffer[index].name,
                                    city: controller.spaOffer[index].cityName,
                                    hotel: controller.spaOffer[index].hotelName,
                                    onTap: (){
                                    },
                                    id:controller.spaOffer[index].offersDetailsDTOList![index].spaId ,
                                  );
                                },

                              )
                          );
                        }),
                      ],
                    )
                  ])
            ],
          );
        })
    );
  }
}
