import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/halls/hall_detail/views/widgets/hall_services.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../components/review_List_widget.dart';
import '../controllers/car_details_controller.dart';

class CarDetailView extends GetView<CarDetailsController> {
  const CarDetailView({Key? key}) : super(key: key);

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
                        path: ApiProvider.imageUrl +  controller.selectedCar.image??"",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  controller.selectedCar.itemImages != null && controller.selectedCar.itemImages!.isNotEmpty
                      ? SizedBox(
                          height: size.height * .1,
                          child: ListView.builder(
                            itemCount: controller.selectedCar.itemImages!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.setSelectedImage(controller.selectedCar.itemImages![index].image);
                                  },
                                  child: ImageWidget(
                                    path: ApiProvider.imageUrl + controller.selectedCar.itemImages![index].image,
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
                            controller.selectedCar.name!,
                            weight: FontWeight.w900,
                            size: 25.w,
                            textColor:Colors.redAccent,
                          ),
                        ),
                        divider,
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: TextWidget(
                                 AppStrings.category,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: TextWidget(
                                  controller.selectedCar.groupName!.toString(),
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
                                  AppStrings.capacity,
                                  weight: FontWeight.bold,
                                  size: 15,
                              ),
                                ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      controller.selectedCar.seatsNumber!.toString(),
                                      weight: FontWeight.bold,
                                      // showInline: controller.hall!.salePrice != null &&  controller.hall!.salePrice != 0 ? true : null,
                                      size: 15,
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                      child:  TextWidget(
                                        AppStrings.seats,
                                        weight: FontWeight.bold,
                                        size: 15,
                                      ),
                                    ),

                                  ],
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
                                  AppStrings.totalPrice,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      controller.selectedCar.seatsNumber!.toString(),
                                      weight: FontWeight.bold,
                                      // showInline: controller.hall!.salePrice != null &&  controller.hall!.salePrice != 0 ? true : null,
                                      size: 15,
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                      child:  TextWidget(
                                        AppStrings.LE,
                                        weight: FontWeight.bold,
                                        size: 15,
                                      ),
                                    ),

                                  ],
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
                                  AppStrings.description,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      controller.selectedCar.describtion!,
                                      weight: FontWeight.bold,
                                      // showInline: controller.hall!.salePrice != null &&  controller.hall!.salePrice != 0 ? true : null,
                                      size: 15,
                                    ),

                                  ],
                                ),

                              ),

                            ],
                          ),
                        ),
                        divider,
                        SizedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * .05,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      TextWidget(AppStrings.additions,
                                        textAlign: TextAlign.start,
                                        weight: FontWeight.bold,
                                        textColor: AppColors.appBlue,
                                        size: 20,

                                      ),
                                    ],
                                  ),
                                ),
                              ),


                              for(AdditionsGroupDtoList group in controller.selectedCar
                                  .additionsGroupDtoList!)


                              controller.selectedCar.additionsGroupDtoList!.isEmpty?TextWidget(AppStrings.notFound):
                              Container(
                                  // width: size.width * .9,
                                  // height: size.height * .3,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: AppColors.appGreyDark,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        group.name!,
                                        weight: FontWeight.bold,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: size.width,
                                        // height: size.height * .1,
                                        child:
                                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              for(int i=0;i<controller.selectedCar.additionsGroupDtoList!.length;i++)
                                                for(int x=0;x<controller.selectedCar.additionsGroupDtoList![i].addtionsDtoList!.length;x++)
                                                TextWidget(controller.selectedCar.additionsGroupDtoList![i].addtionsDtoList![x].name!)
                                            ]
                                          )

                                      ),
                                    ],
                                  ),
                                ),
                              ReviewsListWidget(
                                reviewNumber: 0,
                                reviewsList: [] ,
                                reviewStars: controller.selectedCar.reviewStars ?? 0,
                              )


                            ],
                          ),
                        ),

                        Center(
                          child: SizedBox(
                            width: size.width * 0.4,
                            child: OutlinedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.carsOrder );

                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                ),
                                child: const TextWidget(
                                  AppStrings.back,
                                  textColor: Colors.white,
                                  weight: FontWeight.bold,
                                  size: 20,
                                )),
                          ),
                        ),




                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        }));
  }
}
