
import 'package:easy_hotel/app/core/utils/products_fav_manager.dart';
import 'package:easy_hotel/app/modules/food_item/controllers/food_item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/icon_button_widget.dart';

class ItemAppBar extends GetView<FoodItemController> with PreferredSizeWidget{
  const ItemAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return
    Obx(() => AppBar(
      title: Text(controller.pro.value == null ? "" : controller.pro.value!.name!),
      // centerTitle: true,
      actions: [
        UnconstrainedBox(
          child: IconButtonWidget(
            icon: Icons.favorite_border_rounded,
            onPressed: () {
              FavProductsManager().addProduct(controller.pro.value!, context);
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
    ) );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
