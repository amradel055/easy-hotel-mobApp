import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/halls/hall_detail/views/widgets/hall_services.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../components/review_List_widget.dart';
import '../controllers/hall_details_controller.dart';

class HallDetailView extends GetView<HallDetailsController> {
  const HallDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const divider = Divider(
      thickness: 1,
    );
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Common.getSpin(),
            );
          }
          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      height: 250.h,
                      child: ImageWidget(
                        path: ApiProvider.imageUrl + controller.selectedImage.value.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  controller.hall!.itemImages != null && controller.hall!.itemImages!.isNotEmpty
                      ? SizedBox(
                          height: size.height * .1,
                          child: ListView.builder(
                            itemCount: controller.hall!.itemImages!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.setSelectedImage(controller.hall!.itemImages![index].image);
                                  },
                                  child: ImageWidget(
                                    path: ApiProvider.imageUrl + controller.hall!.itemImages![index].image,
                                    radius: 20.w,
                                    width: size.width * .3,
                                    height: size.height * .18,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ))
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: TextWidget(
                            controller.hall!.name!,
                            weight: FontWeight.w900,
                            size: 25.w,
                            textColor: AppColors.appHallsRedDark,
                          ),
                        ),
                        divider,
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: TextWidget(
                                  AppStrings.capacity.tr,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: TextWidget(
                                  controller.hall!.capacity!.toString(),
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),
                              const Padding(
                                padding:  EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child:  TextWidget(
                                  AppStrings.person,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        divider,
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding:  EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                  child: TextWidget(
                                  AppStrings.prices,
                                  weight: FontWeight.bold,
                                  size: 15,
                              ),
                                ),
                              const Padding(
                                 padding:  EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                 child: TextWidget(
                                  AppStrings.startWith,
                                  weight: FontWeight.bold,
                                  size: 15,
                              ),
                               ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      controller.hall!.price.toString(),
                                      weight: FontWeight.bold,
                                      showInline: controller.hall!.salePrice != null &&  controller.hall!.salePrice != 0 ? true : null,
                                      size: 15,
                                    ),
                                    controller.hall!.salePrice != null &&  controller.hall!.salePrice != 0 ? TextWidget(
                                      controller.hall!.salePrice.toString(),
                                      weight: FontWeight.bold,
                                      size: 15,
                                    ): const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        divider,
                        controller.hall!.featureHoleDTOListSelected!.isNotEmpty ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              AppStrings.servicesHall,
                              weight: FontWeight.w800,
                              textColor: AppColors.appHallsRedDark,
                              size: 17,
                            ),
                            SizedBox(
                                height: size.height * .1,
                                child: ListView.builder(
                                  itemCount: controller.hall!.featureHoleDTOListSelected!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(5 , 0 , 5 , 0),
                                      child: HallServices(
                                          image: controller.hall!.featureHoleDTOListSelected![index].icon!,
                                          name: controller.hall!.featureHoleDTOListSelected![index].name!),
                                    );
                                  },
                                )),
                            divider,
                          ],
                        ): const SizedBox.shrink() ,

                        const TextWidget(
                          AppStrings.reviews,
                          weight: FontWeight.w800,
                          textColor: AppColors.appHallsRedDark,
                          size: 17,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: size.height * 0.1),
                          child: SizedBox(
                              child: ReviewsListWidget(
                                reviewStars:  controller.hall!.reviewStar!.toDouble(),
                                reviewsList: controller.hall!.reviewHoleDTOList!,
                                reviewNumber: controller.hall!.reviewHoleDTOList!.length,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 5,
                right: 0,
                left: 0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * .4,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.HALL_RESERVATION, arguments: controller.hall);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.appHallsRedDark),
                            shape: MaterialStateProperty.all(const StadiumBorder())
                            
                          ),
                          child: const TextWidget(
                            AppStrings.additions,
                            textColor: Colors.white,
                            weight: FontWeight.w800,
                            size: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * .4,
                        child: TextButton(
                          onPressed: () {
                            // Get.toNamed(Routes.MAP, arguments: LatLng(controller.hall!, longitude));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(const StadiumBorder())
                          ),
                          child: const TextWidget(
                            AppStrings.directions,
                            textColor: Colors.white,
                            weight: FontWeight.w800,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
