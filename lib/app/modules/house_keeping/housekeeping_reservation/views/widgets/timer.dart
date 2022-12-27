
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_reservation/controllers/house_keeping_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';



class TimerWidget
    extends GetView<HouseKeepingReservationController> {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  TimePickerSpinner(
      is24HourMode: false,
      time: DateTime.now(),
      normalTextStyle: TextStyle(
          fontSize: 17,
          color: Colors.black
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.appHallsRedDark
      ),
      spacing: 5,
      itemHeight: 25,
      isForce2Digits: true,
      alignment: Alignment.center,
      onTimeChange: (time) {

        controller.dateTime.value=time;

      },
    ));
  }
}
