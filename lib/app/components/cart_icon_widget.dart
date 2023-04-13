
import 'package:badges/badges.dart' as bd;
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/res_cart_manager.dart';
import '../routes/app_pages.dart';
import 'icon_button_widget.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0 , 10 , 0),
            child: Center(
              child: bd.Badge(
                badgeContent: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TextWidget(RestaurantCartManager().cartList.length.toString(), height: 1 , weight: FontWeight.bold, size: 15, textAlign: TextAlign.center,),
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
          );
  }
}