import 'package:badges/badges.dart';
import 'package:easy_hotel/app/modules/food_cart/controllers/food_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/icon_button_widget.dart';
import '../../../../components/text_widget.dart';
import '../../../../core/values/app_strings.dart';
import '../../controllers/resturant_controller.dart';

class RestaurantAppBar extends GetView<RestaurantController> with PreferredSizeWidget {
  const RestaurantAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        title: const TextWidget(AppStrings.foodService),
        centerTitle: true,
        actions: [
          Center(
            // child: Badge(
            //   badgeContent: TextWidget(controller.cartLength.toString(), height: 1 , weight: FontWeight.bold, size: 18,),
            //   alignment: AlignmentDirectional.topEnd,
            //   // largeSize: 20,
            //   // smallSize: 25,
            //   child: UnconstrainedBox(
            //     child: IconButtonWidget(
            //         onPressed: () => Get.toNamed(Routes.FOOD_CART),
            //         icon: Icons.shopping_cart_outlined
            //     ),
            //   ),
            // ),
          )
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

}