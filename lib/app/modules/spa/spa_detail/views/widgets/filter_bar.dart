import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBarWidgets extends GetView<SpaDetailsController> {
  const FilterBarWidgets({Key? key, required this.title, required this.index})
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
        controller.index(index);
      },
      child: Obx(() {
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: index == controller.index.value ?BorderSide(width:  size.height * .002, color: AppColors.appHallsRedDark) : BorderSide.none )
          ),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TextWidget(
                  title,
                  size: size.width * 0.05,
                  weight: index == controller.index.value ? FontWeight
                      .bold : FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.center,
                ),
              )
          ),
        );
      }),
    );
  }

}
