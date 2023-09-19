import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/modules/food_section/controllers/food_section_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/app_constants.dart';
import '../../../resturant/views/widgets/food_item_card.dart';

class ItemsListWidget extends GetView<FoodSectionController> {
  const ItemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.groupLoading.isTrue){
        return Common.getSpin();
      }
      return Expanded(
        child: ListView.separated(
          padding: AppConstants.pagePadding,
          itemCount: controller.groupItems.length,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return FoodItemCard(item: controller.groupItems[index],);
          },
        ),
      );
    });
  }
}
