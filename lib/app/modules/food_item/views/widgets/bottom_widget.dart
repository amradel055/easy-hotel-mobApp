
import 'package:easy_hotel/app/modules/food_item/controllers/food_item_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../components/icon_button_widget.dart';
import '../../../../components/text_widget.dart';
import '../../../../core/values/app_constants.dart';
import '../../../../core/values/app_strings.dart';
class BottomWidget extends GetView<FoodItemController> {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 45,
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .background,
            borderRadius:  const BorderRadius.vertical(top: Radius.circular(AppConstants.radius)),
            boxShadow: [BoxShadow(color: Theme
                .of(context)
                .shadowColor, offset: const Offset(0, 0), spreadRadius: 5, blurRadius: 8)
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               TextWidget(
          controller.pro.value == null ? "" :  controller.pro.value!.price.toString(),
                height: 1,
                weight: FontWeight.bold,
                size: 16,
                children: [TextWidget(AppStrings.LE)],
              ),
              const Spacer(),
              IconButtonWidget(
                icon: Icons.add_shopping_cart_rounded,
                iconSize: 20,
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    });
  }
}
