import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/food_item/controllers/food_item_controller.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/addition_widget.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/app_bar.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/attribute_list_widget.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/bottom_widget.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/item_discription_widget.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/item_images_widget.dart';
import 'package:easy_hotel/app/modules/food_item/views/widgets/reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodItemView extends GetView<FoodItemController> {
  const FoodItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: const ItemAppBar(),
        body: controller.loading.isTrue?  Center(child: Common.getSpin()) :ListView(
          children: [
            const ItemImagesWidget(),
            Padding(
              padding: AppConstants.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ItemDescriptionWidget(),
                  const AttributeListWidget(),
                  Row(
                    children: [
                      const TextWidget(
                        AppStrings.deliveryTime,
                        weight: FontWeight.bold,
                        children: [TextWidget(":")],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.input,
                            minuteLabelText: AppStrings.minutes.tr,
                            hourLabelText: AppStrings.hour.tr,
                            cancelText: AppStrings.cancel.tr,
                            confirmText: AppStrings.ok.tr,
                            helpText: AppStrings.enterTime.tr,
                          );
                        },
                        child: TextWidget(AppStrings.sap, showUnderline: true),
                      )
                    ],
                  ),
                  const Divider(height: 10),
                  const AdditionWidget(),
                  const ReviewsWidget(),
                  const SizedBox(height: 5),
                  // for (int i = 0; i < 2; i++)
                  // const ReviewWidget(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const BottomWidget(),
      );
    });
  }
}
