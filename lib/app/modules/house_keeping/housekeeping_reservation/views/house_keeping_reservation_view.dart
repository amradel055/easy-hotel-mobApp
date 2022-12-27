import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_reservation/views/widgets/timer.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_services/views/widgets/price_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/house_keeping_reservation_controller.dart';

class HouseKeepingReservationView
    extends GetView<HouseKeepingReservationController> {
  const HouseKeepingReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Common.getSpin(),
            );
          }
          return Stack(
            children: [
              Positioned(
                top: 0,
                height: size.height * .4,
                right: 0,
                left: 0,
                child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              controller.res[3]),
                          fit: BoxFit.fill
                      )
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: UnconstrainedBox(
                          child: IconButtonWidget(
                            icon: Icons.arrow_forward_ios,
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ),
                      const Spacer(),
                       TextWidget(
                        controller.res[1],
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * .33,
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.00),
                        topRight: Radius.circular(30.00)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          'يرجي تحديد الموعد..',
                          weight: FontWeight.bold,
                          textColor: AppColors.appBlue,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Container(
                            width: size.width,
                            height: size.height * .25,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(5),

                            ), child:

                          Center(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    controller.pickToDate();
                                  },
                                  child: Obx(() {
                                    return TextWidget(
                                      controller.dateTo.value == null
                                          ? "yyyy-mm-dd"
                                          : DateFormat("yyyy-MM-dd").format(
                                          controller.dateTo.value!),
                                      weight: FontWeight.bold,
                                      size: 30,
                                    );
                                  })),
                            ),
                          ),


                          ),
                        ),

                        // TableCalendar(
                        //   calendarStyle:const CalendarStyle(todayDecoration: BoxDecoration(color:  AppColors.appHallsRedDark, shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(10))),),
                        //    daysOfWeekVisible : false,
                        //    pageJumpingEnabled : true,
                        //   firstDay: DateTime.utc(2010, 10, 16),
                        //   lastDay: DateTime.utc(2030, 3, 14),
                        //   focusedDay: DateTime.now(),
                        //   rowHeight: 40,
                        // ),
                        SizedBox(
                          height: size.height * .1,
                          width: size.width * .9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                'الوقت', weight: FontWeight.bold, size: 25,),
                              Container(
                                  width: size.width * .7,
                                  height: size.height * .1,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(
                                        (Radius.circular(15))),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Center(child: TimerWidget()))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                controller.getHousekeepingSave();
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.4,
                                decoration: const BoxDecoration(
                                  color: AppColors.appHallsRedDark,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                ),
                                child: const TextWidget(
                                  AppStrings.reserve,
                                  textAlign: TextAlign.center,
                                  weight: FontWeight.bold,
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
