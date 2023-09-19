import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/maintenance_services_controller.dart';

class MaintenanceServicesPriceWidget extends GetView<MaintenanceServicesController> {
  const MaintenanceServicesPriceWidget(this.name, this.price, this.index, this.id, this.branchId, {Key? key})
      : super(key: key);
  final String? name;
  final String? price;
  final int? id;
  final int? branchId;
  final RxInt? index;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          height: size.height * .04,
          width: size.width * .9,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),

          child: Obx(() {
            return Container(
              height: size.height * .3,
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.appRedLight
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .435,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      borderRadius:const BorderRadius.only(
                          bottomRight: Radius.circular(20.00),
                          topRight: Radius.circular(20.00)),
                      // color: Colors.grey[300],

                    ),
                    child: Padding(
                      padding:const EdgeInsets.only(right: 10),
                      child: TextWidget(name!, textAlign: TextAlign.right,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    // color: Colors.grey[300],
                    width: size.width * .35,
                    height: size.height * .05,
                    child: TextWidget(

                      price! , textAlign: TextAlign.center,
                      weight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.maintenanceDetail[index!.value].selected!.value =
                      !(controller.maintenanceDetail[index!.value].selected!.value);

                      if (
                      controller.maintenanceDetail[index!.value].selected!.value ==
                          true) {
                        controller.servicesSelectedAdded.add(controller.maintenanceDetail
                            [index!.value]);
                        controller.servicesSelected.add(controller.maintenanceDetail
                            [index!.value].id!);
                        controller.servicesSelectedNames.add(controller.maintenanceDetail
                            [index!.value].name!);
                        controller.servicesSelectedPrices.add(controller.maintenanceDetail
                            [index!.value].price!.toString());
                        print(controller.servicesSelected);
                        print(controller.servicesSelectedNames);
                        print(controller.servicesSelectedPrices);
                      } else {
                        controller.servicesSelectedAdded.remove(controller.maintenanceDetail
                          [index!.value]);
                        controller.servicesSelected.remove(controller.maintenanceDetail
                          [index!.value].id!);
                        controller.servicesSelectedNames.remove(controller.maintenanceDetail
                          [index!.value].name!);
                        controller.servicesSelectedPrices.remove(controller.maintenanceDetail
                          [index!.value].price!.toString());
                        print(controller.servicesSelected);
                        print(controller.servicesSelectedNames);
                        print(controller.servicesSelectedPrices);
                      }
                    },
                    child: Container(
                        width: size.width * .1,
                        height: size.height * .05,
                        decoration: BoxDecoration(
                          borderRadius:const  BorderRadius.only(bottomLeft: Radius
                              .circular(20.00), topLeft: Radius.circular(20.00)),
                          color: controller.maintenanceDetail[index!.value].selected!
                              .value==true ? Colors.green : AppColors.appHallsRedDark,

                        ),

                        child: Icon(controller.maintenanceDetail[index!.value]
                            .selected!.value ==true  ? Icons.check : Icons.add,
                            color: controller.maintenanceDetail[index!.value]
                                .selected!.value == true ? Colors.white : Colors.black,
                            size: size.width * .08)),
                  ),


                ],

              ),
            );
          }),
        ),
      ),
    );
  }

}
