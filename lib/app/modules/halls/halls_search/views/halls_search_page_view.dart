import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_search/views/widgets/category.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/halls_search_page_controller.dart';
import 'widgets/halls_search_card.dart';


class HallsSearchPageView extends GetView<HallsSearchPageController> {
  const HallsSearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final row = Container(
      height: size.height * .002, color: AppColors.appHallsRedDark,
    );
    List<String> hobbyList = [];

    RangeValues _currentRangeValues = const RangeValues(40, 80);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appHallsRedDark,
        foregroundColor: Colors.white,
        title: const TextFieldWidget(
          enabled: true,
          hint: AppStrings.search,
          suffixIcon: Icons.search,
          ltr: true,
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
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesWidgets(title: AppStrings.towns,
                  image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/screen-shot-2021-03-02-at-10-26-31-am-1614702485.png?crop=0.668xw:1.00xh;0.293xw,0&resize=640:*",
                  onTap: () {
                    controller.changeListType(0);
                  },
                  index: controller.selectedType.value,),
                CategoriesWidgets(title: AppStrings.hotels,
                  image: "https://images.unsplash.com/photo-1615460549969-36fa19521a4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGhvdGVsfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                  onTap: () {
                    controller.changeListType(1);
                  },
                  index: controller.selectedType.value,),
                CategoriesWidgets(title: AppStrings.halls,
                  image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spa-treatment-rooms-1584039817.jpg",
                  onTap: () {
                    controller.changeListType(2);
                  },
                  index: controller.selectedType.value,),
              ],),
            row,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                  child: TextWidget(
                    controller.selectedType.value == 0 ? AppStrings.towns :
                    controller.selectedType.value == 1
                        ? AppStrings.hotels
                        : AppStrings.halls, textAlign: TextAlign.left,
                    weight: FontWeight.bold,
                    size: 20.h,),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: Common.getSpin(),
                    );
                  }
                  return SizedBox(
                    height: size.height * .8,
                    child:
                    ListView.builder(
                      itemCount: controller.items.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return HallsSearchCardWidget(
                          type: controller.selectedType.value,
                          image: controller.selectedType.value == 0 ? controller
                              .items[index].image : controller.selectedType
                              .value == 1
                              ? controller.hotels[index].image
                              : controller.halls[index].name!,
                          title: controller.selectedType.value == 0 ? controller
                              .items[index].name! : controller.selectedType
                              .value == 1
                              ? controller.hotels[index].name!
                              : controller.halls[index].name!,
                          subtitle: controller.selectedType.value == 0
                              ? ""
                              : controller.selectedType.value == 1 ? controller
                              .hotels[index].cityName! : controller.halls[index]
                              .hotelName!,
                          id: controller.selectedType.value == 0 ? controller
                              .items[index].id! : controller.selectedType
                              .value == 1
                              ? controller.hotels[index].id!
                              : controller.halls[index].id!,
                        );
                      },

                    ),);
                }),
              ],
            ),


          ],
        );
      }),

    );
  }
}
