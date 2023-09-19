import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../maintenance/maintenance_reservation/views/widgets/timer.dart';
import '../controllers/maintenance_reservation_controller.dart';

class MaintenanceReservationView
    extends GetView<MaintenanceReservationController> {
  const MaintenanceReservationView({Key? key}) : super(key: key);

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
                height: size.height * .35,
                right: 0,
                left: 0,
                child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              ApiProvider.imageUrl+controller.res[3]
                            // AppAssets.maintenance
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
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
                      //  TextWidget(
                      //   controller.res[1],
                      //   weight: FontWeight.bold,
                      //   size: 20,
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * .3,
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.00),
                        topRight: Radius.circular(30.00)),
                    // color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          AppStrings.notes,
                          weight: FontWeight.bold,
                          textColor: AppColors.appBlue,
                          size: 20,
                        ),

                        SizedBox(
                          height: 100,

                          child:
                          TextFieldWidget(
                            maxLines: 5,
                            controller:controller.remark,
                          ),

                          // TextFieldWidget(
                          //   maxLines: 5,
                          //   controller:controller.remark,
                          //   onChange: (value) => controller.remark.text = value,
                          //
                          // ),
                        ),

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
                            decoration: BoxDecoration(
                              // color: Colors.white70,
                              borderRadius: BorderRadius.circular(5),

                            ), child:

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    onTap: () {
                                      controller.pickToDate();
                                    },
                                    child: Obx(() {
                                      return TextWidget(
                                        controller.dateTo.value == null
                                            ? DateFormat("yyyy-MM-dd").format(
                                            DateTime.now())
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
                                AppStrings.time, weight: FontWeight.bold, size: 25,),
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
                          padding: const EdgeInsets.fromLTRB(0,20,0,20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.MAINTENANCE_CHECKOUT,
                                          arguments: [controller.res[2],controller.dateTo.value,controller.dateTime.value,controller.remark.text,controller.res[5],controller.res[6],controller.res[0],controller.res[7]]
                                      );
                                      // controller.getMaintenanceSave();
                                    },
                                    child: Container(
                                      height: size.height * 0.05,
                                      width: size.width * 0.4,
                                      decoration: const BoxDecoration(
                                        color: AppColors.appHallsRedDark,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: const Center(
                                        child:  TextWidget(
                                          AppStrings.reserve,
                                          textAlign: TextAlign.center,
                                          weight: FontWeight.bold,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // controller.getMaintenanceSaveNow();
                                      Get.toNamed(Routes.MAINTENANCE_CHECKOUT,
                                          arguments: [controller.res[2],DateTime.now(),DateTime.now(),controller.remark.text,controller.res[5],controller.res[6],controller.res[0],controller.res[7],controller.res[8]]
                                      );
                                    },
                                    child: Container(
                                      height: size.height * 0.05,
                                      width: size.width * 0.4,
                                      decoration: const BoxDecoration(
                                        color: AppColors.appHallsRedDark,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: const Center(
                                        child:  TextWidget(
                                          AppStrings.reserveNow,
                                          textAlign: TextAlign.center,
                                          weight: FontWeight.bold,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            ],


                          ),
                        )
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
