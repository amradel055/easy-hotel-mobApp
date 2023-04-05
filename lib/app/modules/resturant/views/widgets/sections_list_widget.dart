import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/text_widget.dart';
import '../../../../core/values/app_strings.dart';
import '../../controllers/resturant_controller.dart';
import 'food_section_card.dart';

class SectionListWidget extends GetView<RestaurantController> {
  const SectionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size ;
    return Obx(() {
      if(controller.groupLoading.isTrue){
        return SizedBox(
            height: 150,
            child: Common.getSpin());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(AppStrings.sections, weight: FontWeight.bold, size: 18),
          const SizedBox(height: 10),
          SizedBox(
            height: size.height * 0.3,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
            for(int i = 0; i < controller.groupList.length ; i++)
              FoodSectionCard(group :controller.groupList.toList()[i]),
              ],
              ),
          )

        ],
      );
    });
  }
}
