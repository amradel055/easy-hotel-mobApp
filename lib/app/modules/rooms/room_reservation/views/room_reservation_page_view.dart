import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';

import 'package:flutter/material.dart';


import 'package:get/get.dart';
import '../controllers/room_reservation_page_controller.dart';


class RoomReservationPageView extends GetView<RoomReservationPageController> {
  const RoomReservationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBlue,
          leading: const Icon(Icons.arrow_back, color: Colors.white,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: size.width * .6,
                child: const TextWidget(
                  AppStrings.reserve, weight: FontWeight.bold,
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
            SizedBox(width: size.width * .9,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .07,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextWidget(AppStrings.additions,
                            textAlign: TextAlign.start,
                            weight: FontWeight.bold,
                            textColor: AppColors.appBlue,

                          ),
                        ],
                      ),
                    ),
                  ),


                  for(AdditionsGroupModel group in controller.room
                      .additionsGroupDTOList!)


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
                                      if (controller.selectedAdd.contains(
                                          addition)) {
                                        isSelected = true;
                                      }
                                      return GestureDetector(
                                        onTap: () =>
                                            controller.changeAddedAdditions(
                                                addition),
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 2),
                                            child: Container(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 5, horizontal: 5),
                                              decoration: BoxDecoration(
                                                  color: isSelected ? Colors
                                                      .brown[50] : Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(18),
                                                  border: Border.all(
                                                      color: isSelected
                                                          ? AppColors
                                                          .appHallsRedDark
                                                          : Colors.grey,
                                                      width: 1)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    addition.name!,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15
                                                      ,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(4, 0, 4, 0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${addition.price!
                                                              .toString() +
                                                              AppStrings.LE} ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              decoration: addition
                                                                  .salePrice !=
                                                                  null &&
                                                                  addition
                                                                      .salePrice !=
                                                                      0
                                                                  ? TextDecoration
                                                                  .lineThrough
                                                                  : TextDecoration
                                                                  .none
                                                          ),

                                                        ),
                                                        addition.salePrice !=
                                                            null && addition
                                                            .salePrice != 0
                                                            ? Text(
                                                          "${addition.salePrice!
                                                              .toString() +
                                                              AppStrings.LE} ",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        )
                                                            : const SizedBox
                                                            .shrink(),
                                                      ],
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
                    )


                ],
              ),
            )

            ,

            Obx(() {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, size.height * .01, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: () {

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
                            const TextWidget(
                              AppStrings.reserve, weight: FontWeight.bold,
                              textColor: AppColors.white, size: 20,),
                            TextWidget(controller.totalPrice.string +
                                AppStrings.LE, weight: FontWeight.bold,
                              size: 20,
                              textColor: AppColors.white,
                            )
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              );
            }),

          ],
        )

    );
  }
}
