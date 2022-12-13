import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';


class SpaReservationPrice extends GetView<SpaDetailsController> {
  const SpaReservationPrice(this.name, this.price, this.index, {Key? key})
      : super(key: key);
  final String? name;
  final String? price;
  final RxInt? index;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        height: size.height * .05,
        width: size.width * .9,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),

        child: Obx(() {
          return Container(
            height: size.height * .3,
            width: size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.appRedLight
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * .435,
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(
                        bottomRight: Radius.circular(20.00),
                        topRight: Radius.circular(20.00)),
                    color: Colors.grey[300],

                  ),
                  child: Padding(
                    padding:const EdgeInsets.only(right: 10),
                    child: TextWidget(name!, textAlign: TextAlign.right,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  color: Colors.grey[300],
                  width: size.width * .35,
                  height: size.height * .05,
                  child: TextWidget(
                    price! + AppStrings.LE, textAlign: TextAlign.center,
                    weight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.spa!.spaItemsDtoList![index!.value].selected!.value =
                     !(controller.spa!.spaItemsDtoList![index!.value].selected!.value);

                    if (
                    controller.spa!.spaItemsDtoList![index!.value].selected!.value ==
                    true) {
                      controller.servicesSelected.add(controller.spa!
                          .spaItemsDtoList![index!.value].id!);
                      print(controller.servicesSelected);
                    } else {
                      controller.servicesSelected.remove(controller.spa!
                          .spaItemsDtoList![index!.value].id!);
                      print(controller.servicesSelected);
                    }
                  },
                  child: Container(
                      width: size.width * .1,
                      height: size.height * .05,
                      decoration: BoxDecoration(
                        borderRadius:const  BorderRadius.only(bottomLeft: Radius
                            .circular(20.00), topLeft: Radius.circular(20.00)),
                        color: controller.spa!.spaItemsDtoList![index!.value].selected!
                            .value==true ? Colors.green : AppColors.appHallsRedDark,

                      ),

                      child: Icon(controller.spa!.spaItemsDtoList![index!.value]
                          .selected!.value ==true  ? Icons.check : Icons.add,
                          color: controller.spa!.spaItemsDtoList![index!.value]
                              .selected!.value == true ? Colors.white : Colors.black,
                          size: size.width * .08)),
                ),


              ],

            ),
          );
        }),
      ),
    );
  }

}
