
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/offer_list_widget.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/sections_list_widget.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/sliders_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/food_section_card.dart';
import 'widgets/offer_card.dart';

class ResturantView extends StatelessWidget {
  const ResturantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(AppStrings.foodService),
        centerTitle: true,
        actions: [
          Center(
            // child: Badge(
            //   label: const TextWidget("2", height: 1.5),
            //   alignment: AlignmentDirectional.topEnd,
            //   // largeSize: 20,
            //   smallSize: 20,
            //   child: UnconstrainedBox(
            //     child: IconButtonWidget(
            //         onPressed: () => Get.toNamed(Routes.FOOD_CART),
            //         icon: Icons.shopping_cart_outlined
            //     ),
            //   ),
            // ),
          )
        ],
      ),
      body: ListView(
        padding: AppConstants.pagePadding,
        children: [
          const SlidersWidget(),
          const SizedBox(height: 20),
          const OfferListWidget(),
          const SizedBox(height: 20),
          const SectionListWidget()
        ],
      ),
    );
  }
}
