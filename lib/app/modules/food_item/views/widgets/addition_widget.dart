import 'package:easy_hotel/app/modules/food_item/controllers/food_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/additions_dialog.dart';
import '../../../../components/icon_button_widget.dart';
import '../../../../components/text_widget.dart';
import '../../../../core/values/app_strings.dart';

class AdditionWidget extends GetView<FoodItemController> {
  const AdditionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.pro.value != null && controller.pro.value!.addititonsList!.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const TextWidget(
                AppStrings.additions,
                weight: FontWeight.bold,
                children: [TextWidget(":")],
              ),
              const Spacer(),
              IconButtonWidget(
                icon: Icons.add,
                onPressed: () => Get.dialog(AdditionsDialog()),
                padding: EdgeInsets.zero,
              )
            ],
          ),
          const Divider(height: 5),
        ],
      ):const SizedBox.shrink();
    });
  }
}
