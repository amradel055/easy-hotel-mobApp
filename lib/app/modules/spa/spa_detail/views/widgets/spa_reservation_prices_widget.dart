import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/cars/cars_order/views/widgets/cars_order_time_picker.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_order_time_picker.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_price.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';

class SpaReservationPriceWidget extends GetView<SpaDetailsController> {
  const SpaReservationPriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SizedBox(height: size.height * .5,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  for(int i = 0; i <
                      controller.spa!.spaItemsDtoList!.length; i++)
                    SpaReservationPrice(
                        controller.spa!.spaItemsDtoList![i].name,
                        controller.spa!.spaItemsDtoList![i].price.toString(),
                        controller.spa!.spaItemsDtoList![i].salePrice, i.obs,controller.spa!.spaItemsDtoList![i])
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        AppStrings.arrivalDate,
                        textColor: Colors.black,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                          height: size.height * 0.04,
                          child: const SpaOrderTimePicker(
                            time: false,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        AppStrings.arrivalTime,
                        textColor: Colors.black,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                          height: size.height * 0.04,
                          child: const SpaOrderTimePicker(
                            time: true,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),





          Obx(() {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () async {
                  // controller.getSpaSave();
                  Get.toNamed(Routes.SPA_CHECKOUT, arguments: [
                    controller.spa!.id,
                    controller.servicesSelected.value,
                    controller.spa!.branchId,
                    controller.servicesSelectedNames.value,
                    controller.servicesSelectedPrices.value,
                    controller.selectedAdd.value,
                    controller.totalPrice,
                    controller.dateController.value.text,
                    controller.timeController.value.text,
                    controller.selectedAdd.value,
                    controller.dateController.value.text,
                    controller.timeController.value.text

                  ]);
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.7,
                  decoration: const BoxDecoration(
                    color: AppColors.appHallsRedDark,
                    borderRadius: BorderRadius.all(Radius.circular(
                        10)),
                  ),
                  child: Center(
                    child: TextWidget(controller.totalPrice.toString(),
                      textAlign: TextAlign.center,
                      weight: FontWeight.bold,
                      size: 17,
                      textColor: Colors.white,),
                  ),

                ),
              ),
            );
          }),

        ],
      ),
    )
    ;
  }

}
