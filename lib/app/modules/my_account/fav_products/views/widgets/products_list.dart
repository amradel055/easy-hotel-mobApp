import 'package:easy_hotel/app/modules/my_account/fav_products/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/fav_products_controller.dart';

class ProductsCardListFav extends GetView<FavProductsController> {
  const ProductsCardListFav({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.selectedAppId.value == 1) {
        return Column(
          children: [
            for (int i = 0; i < controller.favRestaurantList.length; i++)
              SizedBox(
                  width: size.width,
                  child: ProductCard(
                    size,
                    true,
                    "1",
                    false,
                    onDeletePressed: () => controller.removeforFav(i),
                    onTap: () => controller.onTap(i),
                    name: controller.favRestaurantList[i].name ?? "",
                    appId: controller.favRestaurantList[i].appId ?? 0,
                    discribtion:
                        controller.favRestaurantList[i].discribtion ?? "",
                    price: controller.favRestaurantList[i].price ?? 0,
                    saleItem: controller.favRestaurantList[i].saleItem ?? false,
                    salePrice: controller.favRestaurantList[i].salePrice ?? 0,
                  ))
          ],
        );
      } else if (controller.selectedAppId.value == 2) {
        return const SizedBox();
        // Get.toNamed(Routes.RESTURANT);
      } else if (controller.selectedAppId.value == 3) {
        return const SizedBox();
        // Get.toNamed(Routes.CARS,arguments: ["" ,controller.selectedAppId.value ]);
      } else if (controller.selectedAppId.value == 4) {
        return const SizedBox();
        // Get.toNamed(Routes.SPADETAILS);
      } else if (controller.selectedAppId.value == 5) {
        return const SizedBox();
        // Get.toNamed(Routes.HOUSE_KEEPING,arguments: ["",controller.selectedAppId.value ]);
      } else if (controller.selectedAppId.value == 6) {
        return const SizedBox();
        // Get.toNamed(Routes.HALLS);
      } else if (controller.selectedAppId.value == 7) {
        return Column(
          children: [
            for (int i = 0; i < controller.favRoomList.length; i++)
              SizedBox(
                  width: size.width,
                  child: ProductCard(
                    size,
                    true,
                    "1",
                    false,
                    onDeletePressed: () => controller.removeforFav(i),
                    onTap: () => controller.onTap(i),
                    name: controller.favRoomList[i].name ?? "",
                    appId: controller.favRoomList[i].appId ?? 0,
                    discribtion: controller.favRoomList[i].description ?? "",
                    price: controller.favRoomList[i].price ?? 0,
                    saleItem: controller.favRoomList[i].saleItem ?? false,
                    salePrice: controller.favRoomList[i].salePrice ?? 0,
                  ))
          ],
        );
        // Get.toNamed(Routes.ROOMS);
      } else if (controller.selectedAppId.value == 8) {
        return const SizedBox();
        // Get.toNamed(Routes.POLMAN,arguments: [imageIn,controller.selectedAppId.value ]);
      } else {
        return const SizedBox();
      }
      return const SizedBox();
    });
  }
}
