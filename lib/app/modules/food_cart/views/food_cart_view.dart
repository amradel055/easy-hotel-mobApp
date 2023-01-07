import 'package:easy_hotel/app/components/custom_card.dart';
import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/food_cart/views/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/app_constants.dart';
import '../controllers/food_cart_controller.dart';

class FoodCartView extends GetView<FoodCartController> {
  const FoodCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.foodCart),
        centerTitle: true,
        actions: [
          Center(
            child: UnconstrainedBox(
              child: IconButtonWidget(
                icon: Icons.history_rounded,
                onPressed: () => controller.removeAll(),
              ),
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            BoxWidget(
              height: 50,
              margin: const EdgeInsets.fromLTRB(AppConstants.padding, 10, AppConstants.padding, 0),
              shadowColor: Colors.transparent,
              radius: AppConstants.radius,
              color: Colors.transparent,
              borderColor: AppColors.grey,
              borderWidth: 2,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: TabBar(
                  // controller: controller.tabController,
                  unselectedLabelColor: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
                  labelColor: Theme.of(context).primaryColor,
                  indicatorColor: Colors.transparent,
                  indicatorWeight: 0.01,
                  onTap: (value){},
                  tabs: const <Tab>[
                    Tab(child: TextWidget(AppStrings.preparing, size: 13)),
                    Tab(child: TextWidget(AppStrings.delivering, size:13)),
                    Tab(child: TextWidget(AppStrings.delivered, size:13)),
                  ]
              ),
            ) ,
            const ItemListWidget()
          ],
        ),
      ),
    );
  }

}
