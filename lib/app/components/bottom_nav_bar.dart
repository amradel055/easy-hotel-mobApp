import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/app_strings.dart';
import '../modules/food_cart/controllers/food_cart_controller.dart';
import '../routes/app_pages.dart';

class AppBottomNavBar extends GetView<FoodCartController> {
  const AppBottomNavBar({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Obx(() => BottomNavigationBar(
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    label: '',
                    tooltip: AppStrings.home),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_box,
                      color: Colors.black,
                    ),
                    label: '',
                    tooltip: AppStrings.allServices),
            BottomNavigationBarItem(
                icon: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     TextWidget(
                        controller.cartList.length.toString(),
                        weight: FontWeight.bold,
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                label: "",
                tooltip: AppStrings.myAccount),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                label: "",
                tooltip: AppStrings.foodCart),
          ],
          onTap: (index) => ontap(index),
          currentIndex: index,
          iconSize: 24,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
        ));
  }

  ontap(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.RESTURANT);
        break;
      case 1:
        Get.toNamed(Routes.MY_ACCOUNT);
        break;
      case 2:
        Get.toNamed(Routes.FOOD_CART);
        break;
      case 3:
        Get.toNamed(Routes.SETTINGS);
        break;
    }
  }
}
