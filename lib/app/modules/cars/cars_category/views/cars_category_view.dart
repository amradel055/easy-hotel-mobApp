import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/modules/cars/cars_category/controllers/cars_category_controller.dart';
import 'package:easy_hotel/app/modules/cars/cars_category/views/widgets/car_widget.dart';
import 'package:easy_hotel/app/modules/cars/cars_category/views/widgets/cars_category_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cars_main/views/widgets/cars_main_appbar.dart';

class CarsCategoryView extends GetView<CarsCategoryController> {
  const CarsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CarsMainAppbar(size.height * 0.27,
             AppStrings.carsCom, AppStrings.carsBar, true
       ,controller.res[1] ),
        body: Obx(() {
          if (controller.loading.value == true) {
            return Common.getSpin();
          }
          return  Obx(() =>SizedBox(
            height: size.height * 0.75,
            width: size.width,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),

              child: controller.catCars.isEmpty?const Center(child: TextWidget(AppStrings.noCarsFound,size: 30,)):Column(
                children: [
                  Obx(() => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: size.width * 0.95,
                            height: size.height * 0.67,
                            child: GridView.count(
                              crossAxisCount: 1,
                              crossAxisSpacing: size.width * 0.1,
                              mainAxisSpacing: size.height * 0.03,
                              childAspectRatio: size.aspectRatio * 3,
                              children: [
                                for(CarsResponse car in controller.catCars)
                                CarWidget(car: car,)
                              ],
                            )),
                      )),
                  // GestureDetector(
                  //   onTap: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return const CarsCategoryFilterDialog();
                  //       },
                  //     );
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.fromLTRB(0, 5, size.width * .6, 0),
                  //     child: Container(
                  //       height: size.height * .06,
                  //       width: size.width * .25,
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(15.00)),
                  //         color: Colors.blueAccent,
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: const [
                  //           TextWidget(
                  //             'filter',
                  //           ),
                  //           Icon(Icons.filter_list)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ));
        }));
  }
}
