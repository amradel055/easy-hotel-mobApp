import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/modules/resturant/controllers/resturant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/text_widget.dart';
import '../../../../core/values/app_constants.dart';
import '../../../../core/values/app_strings.dart';
import 'offer_card.dart';

class OfferListWidget extends GetView<RestaurantController> {
  const OfferListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.offerLoading.isTrue){
        return SizedBox(
            height: 150,
            child: Common.getSpin());
      }
      return controller.offerList.isNotEmpty ? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(AppStrings.todayOffers, weight: FontWeight.bold, size: 18),
          const SizedBox(height: 10),
          Transform.scale(
            scaleX: 1.1,
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
                itemCount: controller.offerList.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return OfferCard(item:controller.offerList[index] ,);
                },
              ),
            ),
          ),
        ],
      ):const SizedBox.shrink();
    });
  }
}
