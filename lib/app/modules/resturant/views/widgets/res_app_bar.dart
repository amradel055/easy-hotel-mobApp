import 'package:badges/badges.dart' as bd;
import 'package:easy_hotel/app/modules/food_cart/controllers/food_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/icon_button_widget.dart';
import '../../../../components/text_widget.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/resturant_controller.dart';

class RestaurantAppBar extends GetView<RestaurantController> with PreferredSizeWidget {
  const RestaurantAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const TextWidget(AppStrings.foodService),
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0 , 10 , 0),
            child: Center(
              child: bd.Badge(
                badgeContent: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextWidget(controller.cartLength.toString(), height: 1 , weight: FontWeight.bold, size: 15, textAlign: TextAlign.center,),
                ),
                alignment: AlignmentDirectional.topStart,
                child: UnconstrainedBox(
                  child: IconButtonWidget(
                      onPressed: () => Get.toNamed(Routes.FOOD_CART),
                      icon: Icons.shopping_cart_outlined
                  ),
                ),
              ),
            ),
          )
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

}