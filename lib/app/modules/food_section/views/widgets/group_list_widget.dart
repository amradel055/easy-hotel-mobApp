

import 'package:easy_hotel/app/data/model/restaurant/dto/response/group_response.dart';
import 'package:easy_hotel/app/modules/food_section/controllers/food_section_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/text_widget.dart';
import '../../../../core/values/app_constants.dart';

class GroupListWidget extends GetView<FoodSectionController> {
  const GroupListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SizedBox(
      width: size.width * 0.95,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15, right: 10, bottom: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(GroupResponse group in controller.groupsList)
              GestureDetector(
                onTap: () => controller.onGroupSelected(group),
                child: Container(
                  decoration: BoxDecoration (
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(AppConstants.radius)
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: TextWidget(group.name!, weight: FontWeight.bold,),
                ),
              ) ,
          ],
        ),
      ),
    );
  }
}
