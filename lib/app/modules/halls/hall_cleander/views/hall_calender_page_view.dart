import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../data/model/halls/dto/response/halls_periods_response.dart';
import '../controllers/hall_calender_page_controller.dart';

class HallCalenderPageView extends GetView<HallCalenderPageController> {
  const HallCalenderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.appHallsRedDark,
          foregroundColor: Colors.white,
          title: const TextWidget(
            AppStrings.hallReserve,
            textColor: Colors.white,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.8,
                width: size.width,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Obx(() {
                        return TableCalendar(
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(color: AppColors.appHallsRedDark, shape: BoxShape.circle),
                          ),
                          daysOfWeekVisible: true,
                          availableGestures: AvailableGestures.all,
                          headerVisible: true,
                          headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                          pageJumpingEnabled: false,
                          weekNumbersVisible: false,
                          firstDay: DateTime.now(),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: controller.selectedDay.value,
                          rowHeight: 40,
                          daysOfWeekHeight: 40,
                          currentDay: controller.selectedDay.value,
                          onDaySelected: (d1, d2) {
                            controller.setSelectedDay(d1);
                          },
                        );
                      }),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const TextWidget(
                                  AppStrings.availablePeriods,
                                  size: 13,
                                  weight: FontWeight.w600,
                                ),
                                Container(
                                  width: size.width * 0.45,
                                  height: size.height * 0.06,
                                  decoration: BoxDecoration(color: Colors.brown[50], borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: DropdownButtonHideUnderline(

                                      child: DropdownButton<HallsPeriodsResponse>(
                                        items: controller.isPeriodLoading.value == true ? [] :
                                            controller.hallPeriods.toList()
                                            .map((e) => DropdownMenuItem<HallsPeriodsResponse>(
                                            alignment: Alignment.center,
                                            value: e,
                                            enabled: e.enabled!,
                                            child: Container(
                                              color: e.enabled == false ? Colors.grey[300] : Colors.transparent,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  TextWidget(e.name!),
                                                 e.enabled == false ? const TextWidget(AppStrings.reserved ,size: 11, textColor: AppColors.appHallsRedDark, weight: FontWeight.bold,):const SizedBox.shrink(),
                                                ],
                                              ),
                                            ),
                                        ))
                                            .toList(),
                                        onChanged: (val) => controller.setSelectedPeriod(val!),
                                        value: controller.selectedPeriod.value,
                                        alignment: Alignment.center,
                                        iconSize: 25,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.addDay();
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.6,
                            decoration: BoxDecoration(color: AppColors.appHallsRedDark, borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: TextWidget(
                                AppStrings.add,
                                textColor: Colors.white,
                                weight: FontWeight.bold,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Obx(() {
                        return SizedBox(
                          width: size.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                AppStrings.requiredDays,
                                size: 15,
                                weight: FontWeight.w600,
                              ),
                              for(int i = 0; i < controller.selectedDaysList.length; i++)
                                SizedBox(
                                  width: size.width * 0.9,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextWidget(controller.selectedDaysList[i].name! , weight: FontWeight.bold,),
                                      TextWidget(DateFormat('yyyy:MM:dd').format(controller.selectedDaysList[i].date!), weight: FontWeight.bold,),
                                      TextWidget(controller.dayTotalPrice.value.toString(), weight: FontWeight.bold,),
                                      IconButton(
                                          onPressed: (){
                                            controller.deleteDay(i);
                                          },
                                          icon: const Icon(Icons.delete_forever_outlined , color: AppColors.appHallsRedDark))
                                    ],
                                  ),
                                )
                            ],
                          ),
                        );
                      })
                    ]),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    // color: Colors.brown[50],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * .9,
                            height: 30,
                            child: Row(
                              children: [
                               const TextWidget(AppStrings.totalPrice, size: 18, weight: FontWeight.bold,),
                                Obx((){
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                    child: TextWidget(controller.allTotalPrice.value.toString(), size: 18, weight: FontWeight.bold,),
                                  ) ;
                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * .4,
                            height: size.height * 0.06,
                            child: TextButton(
                              onPressed: () {
                                controller.getHallSave();
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(AppColors.appHallsRedDark), shape: MaterialStateProperty.all(const StadiumBorder())),
                              child: const TextWidget(
                                AppStrings.reserve,
                                textColor: Colors.white,
                                weight: FontWeight.bold,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Obx((){
                if(controller.isPeriodLoading.value == true){
                  return Center(child: Common.getSpin());
                }else{
                  return const SizedBox.shrink();
                }
              }
              )
            ],
          ),
        ));
  }
}
