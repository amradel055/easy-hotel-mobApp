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
import '../controllers/room_reservation_page_controller.dart';


class RoomReservationPageView extends GetView<RoomReservationPageController> {
  const RoomReservationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final selectedAdd = <AddtionsModel>[].obs;


    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBlue,
          leading: const Icon(Icons.arrow_back, color: Colors.white,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: size.width * .6,
                child: TextWidget(AppStrings.reserve, weight: FontWeight.bold,
                  size: 25,
                  textColor: Colors.white,
                  textAlign: TextAlign.right,),

              ),
            ),
          ],
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: size.width * .9,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .07,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget("كل الخدمات",
                            textAlign: TextAlign.start,
                            weight: FontWeight.bold,
                            textColor: AppColors.appBlue,

                          ),
                        ],
                      ),
                    ),
                  ),


                  for(AdditionsGroupModel additiongroup in controller.room
                      .additionsGroupDTOList!)

                    Obx(() {
                      return Column(
                        children: [

                          TextWidget(additiongroup.name!,
                            weight: FontWeight.bold, size: 20,
                          ),
                          SizedBox(width: size.width, height: size.height * .25,
                            child: GridView.count(crossAxisCount: 3,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 0,
                              childAspectRatio: size.aspectRatio * 5,
                              children: additiongroup.addtionsDtoList!.map((
                                  addition) =>
                                  CheckboxListTile(
                                    title: TextWidget(addition.name! + '(' +
                                        addition.price!.toString() + ')',
                                      weight: FontWeight.bold,),
                                    value: controller.selectedadditions
                                        .contains(
                                        addition),
                                    checkColor: Colors.white,
                                    activeColor: AppColors.appBlue,
                                    onChanged: (value) {
                                      final selectedadditions = controller
                                          .selectedadditions;
                                      if (value!) {
                                        selectedadditions.add(addition);
                                      } else {
                                        selectedadditions.remove(addition);
                                      }
                                    },
                                  )).toList(),
                            ),
                          ),

                        ],
                      );
                    }),


                ],
              ),
            )

            ,

            Padding(
              padding: EdgeInsets.fromLTRB(0, size.height * .01, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => clientinfo()));

                    controller.getRoomSave();
                  },
                    child: Container(alignment: Alignment.centerRight,

                      height: size.height * .05,
                      width: size.width * .6,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.00)),
                        color: AppColors.appBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextWidget(
                            AppStrings.reserve, weight: FontWeight.bold,
                            textColor: AppColors.white,),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),

          ],
        )

    );;
  }
}
