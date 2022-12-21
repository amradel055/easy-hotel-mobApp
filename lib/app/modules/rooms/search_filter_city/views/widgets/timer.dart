
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';


class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 20,
          color: AppColors.appHallsRedDark
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.black
      ),
      spacing: 4,
      itemHeight: 30,
      isForce2Digits: false,
      onTimeChange: (time) {
      },
    );  }
}
