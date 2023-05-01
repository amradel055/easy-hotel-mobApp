
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/offer_list_widget.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/res_app_bar.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/sections_list_widget.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/sliders_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/bottom_nav_bar.dart';
import '../controllers/resturant_controller.dart';
import 'widgets/food_section_card.dart';
import 'widgets/offer_card.dart';

class ResturantView extends GetView<RestaurantController>  {
  const ResturantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RestaurantAppBar(),
      bottomNavigationBar: const AppBottomNavBar(index: 0 ,),
      body: ListView(
        padding: AppConstants.pagePadding,
        children: const [
          SlidersWidget(),
          SizedBox(height: 20),
          OfferListWidget(),
          SizedBox(height: 20),
          SectionListWidget()
        ],
      ),
    );
  }
}
