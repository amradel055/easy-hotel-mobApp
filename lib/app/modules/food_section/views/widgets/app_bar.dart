

import 'package:easy_hotel/app/modules/food_section/controllers/food_section_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/text_widget.dart';

class RestaurantSectionsAppBar extends GetView<FoodSectionController> with PreferredSizeWidget {
  const RestaurantSectionsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(controller.group.name!),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
