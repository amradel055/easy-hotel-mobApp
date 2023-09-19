import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/review_List_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/halls/hall_detail/views/widgets/hall_services.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/hotel_details_controller.dart';

class HotelDetailView extends GetView<HotelDetailsController> {
  const HotelDetailView({Key? key}) : super(key: key);

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

                    // CarouselSlider(
                    //   items: controller.imageUrls,
                    //   carouselController:controller.buttonCarouselController,
                    //   options: CarouselOptions(
                    //     autoPlay: false,
                    //     enlargeCenterPage: true,
                    //     viewportFraction: 0.9,
                    //     aspectRatio: 2.0,
                    //     initialPage: 2,
                    //   ),
                    // ),
                    // TextButton(
                    //   onPressed: () => controller.buttonCarouselController.nextPage(
                    //       duration: Duration(milliseconds: 300), curve: Curves.linear),
                    //   child: Text('→'),
                    // )
                    //

                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                    itemCount: controller.hotelDetail!.images.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                          width: MediaQuery.of(context).size.width,
                                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(

                                      ),
                          child: ImageWidget(path:ApiProvider.imageUrl + controller.hotelDetail!.images[itemIndex],),
                        ),
                  ),
                  // CarouselSlider(
                  //   options: CarouselOptions(height: 400.0),
                  //   items: [1,2,3,4,5].map((i) {
                  //     return Builder(
                  //       builder: (BuildContext context) {
                  //         return Container(
                  //             width: MediaQuery.of(context).size.width,
                  //             margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.amber
                  //             ),
                  //             child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                  //         );
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 5),
                  //   child: SizedBox(
                  //     height: 250.h,
                  //     child: ImageWidget(
                  //       path: ApiProvider.imageUrl +  controller.selectedCar.image,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // controller.selectedCar.itemImages != null && controller.selectedCar.itemImages!.isNotEmpty
                  //     ? SizedBox(
                  //         height: size.height * .1,
                  //         child: ListView.builder(
                  //           itemCount: controller.selectedCar.itemImages!.length,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             return Padding(
                  //               padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   controller.setSelectedImage(controller.selectedCar.itemImages![index].image);
                  //                 },
                  //                 child: ImageWidget(
                  //                   path: ApiProvider.imageUrl + controller.selectedCar.itemImages![index].image,
                  //                   radius: 20.w,
                  //                   width: size.width * .3,
                  //                   height: size.height * .18,
                  //                   fit: BoxFit.fill,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ))
                  //     : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              child: TextWidget(
                                controller.hotelDetail!.nameEn!,
                                weight: FontWeight.w900,
                                size: 25.w,
                                textColor:Colors.redAccent,
                              ),
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child:RatingBar.builder(
                                    initialRating: controller.hotelDetail!.starNum.toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      GestureDetector(
                                        onTap: () {
                                          if (controller.hotelDetail!.lang == null ||
                                              controller.hotelDetail!.lat == null) {
                                            showPopupText(
                                                AppStrings.locationNotAvailable.tr);
                                            return;
                                          }
                                          Get.toNamed(Routes.MAP, arguments: [
                                            LatLng(controller.hotelDetail!.lat!,
                                                controller.hotelDetail!.lang!),
                                            controller.hotelDetail?.nameEn?.toString() ?? "",
                                            ApiProvider.imageUrl +
                                                (controller.hotelDetail?.image?.toString() ??
                                                    ""),
                                          ]);
                                        },
                                        child: SizedBox(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.directions,
                                                size: size.width * .03,
                                                color: AppColors.appBlue,
                                              ),
                                              TextWidget(
                                                AppStrings.directions,
                                                weight: FontWeight.w600,
                                                size: size.width * 0.045,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        divider,
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: TextWidget(
                                 controller.hotelDetail!.cityName,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        divider,

                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [


                              Padding(
                                padding: const EdgeInsets.fromLTRB(4 , 0 , 4,0),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      controller.hotelDetail!.description??"لا يوجد وصف",
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
                        Center(child: TextWidget(AppStrings.services,size: 25,))
                        ,Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
          for(int i =0;i<controller.hotelDetail!.services.length;i++)

          TableRow(children: [
                                  TextWidget(controller.hotelDetail!.services[i]
                                      .title ?? "",size: 15,weight: FontWeight.bold,),
                                  TextWidget(controller.hotelDetail!.services[i]
                                      .text ?? "لا يوجد",size: 15,weight: FontWeight.bold,),

                              ]),

                            ],
                          ),
                        ),






                      ],
                    ),
                  ),

                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd, // <-- SEE HERE

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: size.width * 0.4,
                    child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ALLSERVICES );

                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.redAccent.withOpacity(.8)),
                          
                        ),
                        child: const TextWidget(
                          AppStrings.skip,
                          textColor: Colors.white,
                          weight: FontWeight.bold,
                          size: 20,
                        )),
                  ),
                ),
              ),

            ],
          );
        }));
  }
}
