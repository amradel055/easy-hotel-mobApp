import 'package:easy_hotel/app/components/filter_dialog.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/food_section/views/widgets/app_bar.dart';
import 'package:easy_hotel/app/modules/food_section/views/widgets/items_list_widget.dart';
import 'package:easy_hotel/app/modules/food_section/views/widgets/rest_info_widget.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/food_item_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/food_section_controller.dart';

class FoodSectionView extends StatelessWidget {
  const FoodSectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RestaurantSectionsAppBar(),
      body: Column(
        children: [
          const RestInfoWidget(),
          const Divider(height: 0,color: Colors.black87,),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 15, right: 10, bottom: 15),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(int i =0 ; i<7;i++)
                  Container(
                    decoration: BoxDecoration (
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(AppConstants.radius)
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                    child: const TextWidget("حلويات", weight: FontWeight.bold,),
                  ) ,
              ],
            ),
          ),
        const ItemsListWidget()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(FilterDialog()),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.filter_list_rounded, color: Colors.white),
      ),
    );
  }
}
