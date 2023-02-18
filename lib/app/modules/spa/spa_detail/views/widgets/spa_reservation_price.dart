import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/themes/app_theme.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';

class SpaReservationPrice extends GetView<SpaDetailsController> {
  const SpaReservationPrice(this.name, this.price, this.salePrice, this.index, this.add, {Key? key}) : super(key: key);
  final String? name;
  final String? price;
  final RxInt? index;
  final double? salePrice;
  final SpaItemModel ?add;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: size.height * .06,
          width: size.width * .9,
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Obx(() {
            return Container(
              height: size.height * .3,
              width: size.width,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.appRedLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .435,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20.00), topRight: Radius.circular(20.00)),
                      color: AppTheme.isDark?Colors.grey[800]:AppColors.appGreyDark,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Center(
                        child: TextWidget(
                          name!,
                          textAlign: TextAlign.right,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppTheme.isDark?Colors.grey[800]:AppColors.appGreyDark,
                    width: size.width * .35,
                    height: size.height * .1,
                    child: salePrice == null
                        ? Center(
                            child: TextWidget(
                              price! + AppStrings.LE.tr,
                              textAlign: TextAlign.center,
                              weight: FontWeight.bold,
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                price! + AppStrings.LE.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough, fontSize: 10),
                              ),
                              Text(
                                salePrice!.toString() + AppStrings.LE.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeAddedAdditions(add!);
                      if (!controller.servicesSelected.toList().contains(controller.spa!.spaItemsDtoList![index!.value].id)) {
                        controller.servicesSelected.add(controller.spa!.spaItemsDtoList![index!.value].id!);
                        // controller.selectedAdd.add(controller.spa!.spaItemsDtoList![index!.value]);
                        controller.servicesSelectedNames.add(controller.spa!.spaItemsDtoList![index!.value].name!);
                        controller.servicesSelectedPrices.add( salePrice == null?controller.spa!.spaItemsDtoList![index!.value].price!.toString():salePrice.toString());
                        // controller.changeAddedAdditions(controller.spa!);
                        print(controller.selectedAdd);
                      } else {
                        controller.servicesSelected.remove(controller.spa!.spaItemsDtoList![index!.value].id!);
                        // controller.selectedAdd.remove(controller.spa!.spaItemsDtoList![index!.value]);
                        controller.servicesSelectedNames.remove(controller.spa!.spaItemsDtoList![index!.value].name!);
                        controller.servicesSelectedPrices.remove( salePrice == null?controller.spa!.spaItemsDtoList![index!.value].price!.toString():salePrice.toString());
                        print(controller.selectedAdd);
                        // controller.changeAddedAdditions();

                      }
                    },
                    child: Container(
                        width: size.width * .1,
                        height: size.height * .07,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.00), topLeft: Radius.circular(20.00)),
                            color: controller.servicesSelected.toList().contains(controller.spa!.spaItemsDtoList![index!.value].id)
                                ? Colors.green
                                : AppColors.appHallsRedDark
                            ),
                        child: Icon(
                            controller.servicesSelected.toList().contains(controller.spa!.spaItemsDtoList![index!.value].id) ? Icons.check : Icons.add,
                            color:
                                controller.servicesSelected.toList().contains(controller.spa!.spaItemsDtoList![index!.value].id)
                                    ? Colors.white
                                    : Colors.black,
                            size: size.width * .08)),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
