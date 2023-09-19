import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/review_List_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/maintenance/maintenance_services/views/widgets/price_services.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maintenance_services_controller.dart';

class MaintenanceServicesView extends GetView<MaintenanceServicesController> {
  const MaintenanceServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body:Obx((){
          if(  controller.maintenanceGroup.isEmpty||controller.isLoading.isTrue||controller.servicesLoading.isTrue||controller.reviewsLoading.isTrue){
            return Container(
                color: Colors.white,
                child: Common.getSpin());
          }
          return
           SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),

            child: Obx((){ return
              Column(
              children: [
                // ImageWidget(path:  ApiProvider.imageUrl+controller.args[2]!)
                Container(
                    height: size.height * .3,


                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                               controller.maintenanceGroup[0].img==null?"":   ApiProvider.imageUrl + controller.maintenanceGroup[0].img!,
                              // AppAssets.maintenance
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: UnconstrainedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButtonWidget(
                                icon: Icons.arrow_forward_ios,
                                onPressed: () => Get.back(),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextWidget(
                         controller.maintenanceGroup[0].name??"",
                          weight: FontWeight.bold,
                          size: 20,
                        ),
                      ],
                    )
                ),
                Container(width: size.width,
                  height: size.height * .7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.00),
                        topRight: Radius.circular(30.00)),
                    // color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(size.width * .05, 0, 25, 0),
                    child: Obx(() {
                      if (controller.servicesLoading.value) {
                        return Center(
                          child: Common.getSpin(),
                        );
                      }
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          // height: size.height*.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(AppStrings.services,
                                weight: FontWeight.bold,
                                textColor: AppColors.appBlue,
                                size: 20,),
                              Obx(() {
                                if (controller.servicesLoading.value) {
                                  return Center(
                                    child: Common.getSpin(),
                                  );
                                }
                                return SizedBox(
                                  height: size.height * 0.3,
                                  child: Column(
                                    children: [
                                      for(int i = 0; i <
                                          controller.maintenanceDetail
                                              .length; i++)
                                        MaintenanceServicesPriceWidget(
                                          controller.maintenanceDetail[i]
                                              .name!,
                                          controller.maintenanceDetail[i]
                                              .price == null ||
                                              controller
                                                  .maintenanceDetail[i]
                                                  .price == 0 ? AppStrings
                                              .free :
                                          controller.maintenanceDetail[i]
                                              .price!.toString(),
                                          i.obs,
                                          controller.maintenanceDetail[i]
                                              .id!,
                                          controller.maintenanceDetail[i]
                                              .branchId,)
                                    ],
                                  ),
                                );
                              }),
                              controller.reviewsResponse == null ||controller.reviewsResponse!.reviewMaintenanceDtoList!.isEmpty
                                  ? const  TextWidget(AppStrings.noReview,
                                weight: FontWeight.bold,
                                textColor: AppColors.appBlue,
                                size: 20,)
                                  : const TextWidget(AppStrings.reviews,
                                weight: FontWeight.bold,
                                textColor: AppColors.appBlue,
                                size: 20,),
                              controller.reviewsResponse == null ||
                                  controller.reviewsResponse!
                                      .reviewMaintenanceDtoList!.isEmpty
                                  ? const SizedBox()
                                  : SizedBox(
                                  child: Obx(() {
                                    if (controller.reviewsLoading.value) {
                                      return Center(
                                        child: Common.getSpin(),
                                      );
                                    }
                                    return ReviewsListWidget(
                                      reviewStars: controller.reviewsResponse!
                                          .starAverage ?? 0,
                                      reviewsList: controller.reviewsResponse!
                                          .reviewMaintenanceDtoList ?? [],
                                      reviewNumber: controller.reviewsResponse!
                                          .reviewMaintenanceDtoList!.length,
                                    );
                                  })),

                              controller.servicesSelected.isNotEmpty ? Padding(
                                padding: EdgeInsets.only(
                                    top: controller.reviewsResponse !=null?controller.reviewsResponse!
                                        .reviewMaintenanceDtoList!.isEmpty
                                        ? 200
                                        : 0:0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.MAINTENANCE_RESERVATION,
                                            arguments: [
                                              controller.args[0],
                                              controller.args[1],
                                              controller.servicesSelected.value,
                                              controller.maintenanceGroup[0].img??"",
                                              controller.maintenanceGroup[0].branchId,
                                              controller.servicesSelectedNames
                                                  .value,
                                              controller.servicesSelectedPrices
                                                  .value,
                                                controller.maintenanceGroup[0].branchId,
                                              controller.servicesSelectedAdded.value
                                            ]
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.05,
                                          width: size.width * 0.7,
                                          decoration: BoxDecoration(
                                            color: AppColors.appHallsRedDark,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(size.width * 0.05)),
                                          ),
                                          child: Center(
                                            child: const TextWidget(
                                              AppStrings.reserve, textAlign: TextAlign.center,
                                              weight: FontWeight.bold,
                                              textColor: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ) : SizedBox()
                            ],),
                        ),
                      );
                    }),
                  ),
                ),
              ],);})
          );})

    );
  }
}
