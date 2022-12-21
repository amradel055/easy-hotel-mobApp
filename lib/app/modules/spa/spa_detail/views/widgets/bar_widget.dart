import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarWidgets extends GetView<SpaDetailsController> {
  const BarWidgets({Key? key, required this.title, required this.index})
      : super(key: key);
  final String title;
  final int index;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onTap: () {
        controller.serviceIndex(index);
      },
      child: Obx(() {
        return Center(
          child: Container(
            height: size.height * .06,
            width: size.width * .45,
            decoration: BoxDecoration(
                color: index == controller.serviceIndex.value ? AppColors
                    .appHallsRedDark : AppColors.appHallsRed,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: TextWidget(
              title,
              size:size.width * 0.05 ,
              weight: index == controller.serviceIndex.value ? FontWeight.bold : FontWeight.normal,
              textColor: index == controller.serviceIndex.value ? Colors.white : Colors.black,  textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }

}
