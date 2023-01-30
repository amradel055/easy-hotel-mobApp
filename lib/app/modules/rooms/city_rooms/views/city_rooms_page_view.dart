import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/modules/rooms/city_rooms/views/widgets/rooms_search_card.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/city_rooms_page_controller.dart';


class CityRoomsPageView extends GetView<CityRoomsPageController> {
  const CityRoomsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBlue,
        foregroundColor: Colors.white,
        title: const TextWidget(
          AppStrings.cityRooms, weight: FontWeight.bold,
          size: 25,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Common.getSpin(),
          );
        }
        return ListView.builder(
          itemCount: controller.roomsCity.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return RoomsCardWidget(
             controller.roomsCity[index].price!.toDouble(),
               controller.roomsCity[index].id!,
               controller.roomsCity[index].image ?? "",
               controller.roomsCity[index].hotelName!,
               controller.roomsCity[index].cityName!,
              () {},);
          },

        );
      }),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: AppColors.appBlue,
        closeButtonHeroTag: UniqueKey(),
        openButtonHeroTag: UniqueKey(),
        child: const Icon(Icons.filter_list_rounded, color: Colors.white,),
        children: [
          FloatingActionButton.small(
            backgroundColor: AppColors.appBlue,
            child: const Icon(Icons.filter, color: Colors.white,),
            onPressed: () {
              Widget okButton = TextButton(
                child: const Center(child: TextWidget(
                  AppStrings.search, textColor: Colors.white,
                  size: 15,
                  weight: FontWeight.bold,)),
                onPressed: () {
                  controller.from=controller.currentRangeValues.start;
                  controller.to=controller.currentRangeValues.end;
                  controller.starNum=controller.selectedStarsNumber.value;
                  controller.selectedAdditions=controller.selectedAdd;
                  controller.getRoomsCity();

                  Get.back();
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: const Center(child: TextWidget(
                            "Filter", weight: FontWeight.bold,)),
                          content: SizedBox(
                            height: size.height,
                            width: size.width,

                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Obx(() {
                                return Column(
                                  children: [
                                    for(AdditionsGroupModel add in controller
                                        .allAdditions)
                                      Column(
                                        children: [
                                          Text(add.name!),
                                          SizedBox(width: size.width * .9,

                                            child:
                                            Wrap(children: add.addtionsDtoList!
                                                .map((hobby) {
                                              bool isSelected = false;
                                              if (controller.selectedAdd
                                                  .contains(hobby)) {
                                                isSelected = true;
                                              }
                                              return GestureDetector(
                                                onTap: () {
                                                  if (!controller.selectedAdd
                                                      .contains(hobby)) {
                                                    if (controller.selectedAdd
                                                        .length <
                                                        add.addtionsDtoList!
                                                            .length) {
                                                      controller.selectedAdd
                                                          .add(hobby);
                                                      setState(() {});
                                                      print(controller
                                                          .selectedAdd);
                                                    }
                                                  } else {
                                                    controller.selectedAdd
                                                        .removeWhere((
                                                        element) =>
                                                    element == hobby);
                                                    setState(() {});
                                                    print(
                                                        controller.selectedAdd);
                                                  }
                                                },
                                                child: Container(
                                                    margin: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5,
                                                        vertical: 4),
                                                    child: Container(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 12),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .brown[300],
                                                          borderRadius: BorderRadius
                                                              .circular(18),
                                                          border: Border.all(
                                                              color: isSelected
                                                                  ? Colors.green
                                                                  : Colors.grey,
                                                              width: 2)),
                                                      child: Text(
                                                        hobby.name!,
                                                        style: TextStyle(
                                                            color:
                                                            isSelected ? Colors
                                                                .red : Colors
                                                                .white,
                                                            fontSize: 14),
                                                      ),
                                                    )),
                                              );
                                            },
                                            ).toList(),
                                            ),


                                            // GridView.count(crossAxisCount: 3,
                                            //   crossAxisSpacing: 2,
                                            //   mainAxisSpacing: 1,
                                            //   childAspectRatio: size.aspectRatio * 9,
                                            //
                                            //   children: [
                                            //     for(int i = 0 ; i <= 6 ; i++)
                                            //       GestureDetector(
                                            //         onTap: (){},
                                            //         child: Container(height: size.height*.02,
                                            //             decoration: BoxDecoration(color: Colors.brown[300],
                                            //                 borderRadius: BorderRadius.all(Radius.circular(20))),
                                            //
                                            //
                                            //             child: Text('قاعة اضافية' ,style: smallTextStyleNormal(size,color: Colors.white),textAlign:TextAlign.center,)),
                                            //
                                            //
                                            //       )
                                            //
                                            //
                                            //   ],
                                            // ),
                                          ),
                                        ],
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: Container(width: size.width * .82,
                                        height: size.height * .2,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Container(width: size.width * .3,
                                              height: size.height * .2,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      const TextWidget(
                                                          'من سعر'),
                                                      TextWidget(
                                                          controller
                                                              .currentRangeValues
                                                              .start
                                                              .round()
                                                              .toString()),
                                                      const TextWidget(
                                                          AppStrings.LE),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            , Container(
                                              width: size.width * .005,
                                              height: size.height * .18,
                                              color: Colors.black,

                                            ),
                                            SizedBox(width: size.width * .3,
                                              height: size.height * 2,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      const TextWidget(
                                                        'الي سعر',),
                                                      Text(controller
                                                          .currentRangeValues
                                                          .end
                                                          .round().toString(),),
                                                      const TextWidget(
                                                          AppStrings.LE),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    RangeSlider(
                                      values: controller.currentRangeValues,
                                      max: 10000,
                                      divisions: 10000,
                                      labels: RangeLabels(
                                        controller.currentRangeValues.start
                                            .round()
                                            .toString(),
                                        controller.currentRangeValues.end
                                            .round().toString(),
                                      ),
                                      onChanged: (RangeValues values) {
                                        setState(() {
                                          controller.currentRangeValues =
                                              values;
                                        });
                                      },
                                    ),
                                    Obx(() =>
                                        Container(
                                          width: size.width * 0.8,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(size.width * 0.03),
                                              color: AppColors.appRedLight),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  RatingBar.builder(
                                                    initialRating: 1,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: false,
                                                    itemCount: 5,
                                                    itemSize: size.width * 0.1,
                                                    itemPadding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 0.0),
                                                    itemBuilder: (context, _) =>
                                                    const Icon(
                                                      Icons.star,
                                                      color: AppColors
                                                          .appHallsRedDark,
                                                    ),
                                                    onRatingUpdate: (value) =>
                                                        controller
                                                            .changeSelectedStarsNumber(
                                                            value.toInt()),
                                                  ),
                                                  TextWidget(
                                                    "${controller
                                                        .selectedStarsNumber
                                                        .value}" + " نجوم",
                                                    textColor: Colors.grey,
                                                    size: 16,
                                                    weight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),


                                  ],
                                );
                              }),
                            ),
                          ),
                          actions: [
                            Center(
                              child: Container(
                                  height: size.height * .06,
                                  width: size.width * .4,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6.00)),
                                    color: Colors.blueAccent,
                                  ),
                                  child: okButton),
                            ),
                          ],
                        );
                      });
                },
              );
            },
          ),
          FloatingActionButton.small(
            backgroundColor: AppColors.appBlue,
            child: const Icon(Icons.sort, color: Colors.white,),
            onPressed: () {


            },
          ),
        ],
      ),
    );
  }
}
