import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/modules/spa/spa_search/views/widgets/category.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/hall_reservation_page_controller.dart';

class HallReservationPageView extends GetView<HallReservationPageController> {
  const HallReservationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appHallsRedDark,
          foregroundColor: Colors.white,
          title: const TextWidget(
            AppStrings.additions,
            textColor: Colors.white,
            weight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(padding: const EdgeInsets.all(15), children: [
              const TextWidget(
                AppStrings.additionsForHall,
                weight: FontWeight.bold,
                size: 20,
              ),
              SizedBox(
                height: size.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (AdditionsGroupModel group in controller.hall.additionsGroupDTOList!)
                      Container(
                        width: size.width * .9,
                        // height: size.height * .3,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.appGreyDark,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                group.name!,
                                weight: FontWeight.bold,
                                size: 20,
                              ),
                              SizedBox(
                                width: size.width,
                                // height: size.height * .1,
                                child: Obx(() {
                                  return Wrap(
                                    children: group.addtionsDtoList!.map(
                                          (addition) {
                                        bool isSelected = false;
                                        if (controller.selectedAdd.contains(addition)) {
                                          isSelected = true;
                                        }
                                        return GestureDetector(
                                          onTap: () => controller.changeAddedAdditions(addition),
                                          child: Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color: isSelected ? Colors.brown[50] : Colors.white,
                                                    borderRadius: BorderRadius.circular(18),
                                                    border: Border.all(color: isSelected ? AppColors.appHallsRedDark : Colors.grey, width: 1)),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      addition.name!,
                                                      style: const TextStyle(color: Colors.black , fontSize: 15),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                                      child: Text(
                                                        "${addition.price!} ج",
                                                        style: const TextStyle(color: Colors.black, fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        );
                                      },
                                    ).toList(),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ]),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.brown[50],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * .9,
                          child: Row(
                            children: [
                              const TextWidget(AppStrings.totalPrice, size: 18, weight: FontWeight.bold,),
                              Obx((){
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                  child: TextWidget(controller.totalPrice.string, size: 18, weight: FontWeight.bold,),
                                );
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * .9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: size.width * .4,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.HALL_CALENDER, arguments: [controller.hall, controller.selectedAdd.value]);
                                  },
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appHallsRedDark)),
                                  child: const TextWidget(
                                    'استمرار',
                                    textColor: Colors.white,
                                    weight: FontWeight.bold,
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .4,
                                child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                                  child: const TextWidget(
                                    'رجوع',
                                    textColor: Colors.white,
                                    weight: FontWeight.bold,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
