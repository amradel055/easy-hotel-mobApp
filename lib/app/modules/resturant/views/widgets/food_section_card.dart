import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/resturant/controllers/resturant_controller.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/model/restaurant/dto/group_selected_dto.dart';
import '../../../../data/model/restaurant/dto/response/group_response.dart';

class FoodSectionCard extends GetView<RestaurantController> {
  const FoodSectionCard({Key? key , required this.group}) : super(key: key);
   final GroupResponse group ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final GroupSelectedDTO selected = GroupSelectedDTO(
            selectedGroups: group , groupList: controller.groupList );
        Get.toNamed(Routes.FOOD_SECTION , arguments: selected);
      } ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radius),
        ),
        clipBehavior: Clip.antiAlias,
        height: 150,
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
                child: ImageWidget(
              path: ApiProvider.imageUrl + group.img.toString(),
              fit: BoxFit.cover,
              backgroundColor: Colors.black12,
            )),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: TextWidget(
                  group.name!,
                  maxLines: 1,
                  size: 18,
                  textColor: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
