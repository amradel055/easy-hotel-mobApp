import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_groups_response_dto.dart';
import 'package:easy_hotel/app/modules/cars/cars_main/controllers/cars_main_controller.dart';
import 'package:easy_hotel/app/modules/cars/cars_main/views/widgets/cars_main_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/cars_main_categories_widget.dart';

class CarsMainView extends GetView<CarsMainController> {
  const CarsMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:CarsMainAppbar(size.height * 0.25 , "تمتع بالراحة" , "استمتع بخدمات اضافية مميزه لرحلتك" , false,controller.res[0]),
      body: Obx((){
        if(controller.loading.value == true){
          return Common.getSpin();
        }
       return Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            height: size.height * 0.75,
            width: size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        AppStrings.carsChoose ,
                        textColor:AppColors.appBlue ,
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                      Container(
                        color: Colors.grey[400],
                        width: size.width * 0.3,
                        height: size.height * 0.004,
                      ),
                    ],
                  ),
                ),
                Obx(() => Padding(
                  padding: const EdgeInsets.all(AppConstants.padding),
                  child: SizedBox(
                    width: size.width * 0.95,
                    height: size.height * 0.55,
                    child:  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * 0.1,
                      mainAxisSpacing: size.height * 0.06,
                      childAspectRatio: size.aspectRatio * 1.9,
                      children: [
                        // for(GroupModel category in _categories)
                        for(CarsGroupsResponse carsCat in controller.categories)
                          CarsMainCategoryWidget(carsGroup: carsCat,image: carsCat.img==null?"":carsCat.img!,)
                      ],
                    ),
                  ),
                ))
                ,
              ],
            ),
          ),
        );
      }) ,
    );
  }
}
