import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/modules/rooms/hotel_rooms/views/widgets/rooms_search_card.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../controllers/hotel_rooms_page_controller.dart';


class HotelRoomsPageView extends GetView<HotelRoomsPageController> {
  const HotelRoomsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    RangeValues _currentRangeValues = const RangeValues(40, 80);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appHallsRedDark,
        foregroundColor: Colors.white,
        title: const TextWidget(
          AppStrings.hotelRooms, size: 25,
          weight: FontWeight.bold,
          textColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isLoading.value){
          return Center(
            child: Common.getSpin(),
          );
        }
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.h, 0, 20.h, 0),
                  child: TextWidget(AppStrings.rooms, textAlign: TextAlign.left,
                    weight: FontWeight.bold,
                    size: 20.h,),
                ),
                SizedBox(
                  height: size.height * .8,
                  child:
                  ListView.builder(
                    itemCount: controller.roomsHotel.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return  RoomsCardWidget( price: controller.roomsHotel[index].price!.toDouble(), image:controller.roomsHotel[index].image??"", title:controller.roomsHotel[index].hotelName!, subtitle: controller.roomsHotel[index].cityName!,id:controller.roomsHotel[index].id!,onTap:(){},);
                    },

                  ),),
              ],
            ),


          ],
        );
      }),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: AppColors.appHallsRedDark,
        closeButtonHeroTag: UniqueKey(),
        openButtonHeroTag: UniqueKey(),
        child: const Icon(Icons.filter_list_rounded, color: Colors.white,),
        children: [
          FloatingActionButton.small(
            backgroundColor: AppColors.appHallsRedDark,
            child: const Icon(Icons.filter, color: Colors.white,),
            onPressed: () {
              Widget okButton = TextButton(
                child: const Center(child: TextWidget(
                  AppStrings.search, textColor: Colors.white,
                  size: 15,
                  weight: FontWeight.bold,)),
                onPressed: () {
                  controller.getRoomsHotel();
                  Get.back();
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: const Center(child: TextWidget("Filter",weight: FontWeight.bold,)),
                          content: SizedBox(
                            height: size.height * .9,
                            width: size.width,

                            child: Column(
                              children: [
                                for(AdditionsGroupModel add in controller.allAdditions)
                                  Column(
                                    children: [
                                      Text(add.name!),
                                      SizedBox(width: size.width*.9,
                                        height:size.height*.1,

                                        child:
                                        SingleChildScrollView(
                                          physics: const AlwaysScrollableScrollPhysics(),

                                          child:
                                          Wrap(children: add.addtionsDtoList!.map((hobby) {
                                            bool isSelected = false;
                                            if (controller.selectedAdd.contains(hobby)) {
                                              isSelected = true;
                                            }
                                            return GestureDetector(
                                              onTap: () {
                                                if (!controller.selectedAdd.contains(hobby)) {
                                                  if (controller.selectedAdd.length<add.addtionsDtoList!.length) {
                                                    controller.selectedAdd.add(hobby);
                                                    setState(() {});
                                                    print(controller.selectedAdd);
                                                  }
                                                } else {
                                                  controller.selectedAdd
                                                      .removeWhere((element) => element == hobby);
                                                  setState(() {});
                                                  print(controller.selectedAdd);
                                                }
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5, vertical: 4),
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: 5, horizontal: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.brown[300],
                                                        borderRadius: BorderRadius.circular(18),
                                                        border: Border.all(
                                                            color: isSelected
                                                                ? Colors.green
                                                                : Colors.grey,
                                                            width: 2)),
                                                    child: Text(
                                                      hobby.name!,
                                                      style: TextStyle(
                                                          color:
                                                          isSelected ? Colors.red : Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                  )),
                                            );
                                          },
                                          ).toList(),
                                          ),

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
                                            child: GestureDetector(onTap: () {},
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  const TextWidget('من سعر'),
                                                  TextWidget(
                                                      _currentRangeValues.start
                                                          .round().toString()),
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
                                            child: GestureDetector(onTap: () {},
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  const TextWidget('الي سعر',),
                                                  Text(_currentRangeValues.end
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
                                  values: _currentRangeValues,
                                  max: 100,
                                  divisions: 100,
                                  labels: RangeLabels(
                                    _currentRangeValues.start.round()
                                        .toString(),
                                    _currentRangeValues.end.round().toString(),
                                  ),
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      _currentRangeValues = values;
                                    });
                                  },
                                ),


                              ],
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
            backgroundColor: AppColors.appHallsRedDark,
            child: const Icon(Icons.sort, color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
