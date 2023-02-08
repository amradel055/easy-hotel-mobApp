import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SpaOrderTimePicker extends GetView<SpaDetailsController> {
  const SpaOrderTimePicker({required this.time , Key? key}) : super(key: key);
  final bool time ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: time ? controller.timeController.value : controller.dateController.value,
      maxLines: 1,
      readOnly: true,
      style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold,color: Colors.black),
      decoration: const InputDecoration(
          suffixIcon: Icon(Icons.date_range),
          hintText: "",
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 4),
      ),
      onTap: () async {
       !time ? await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
        ).then((value) {
          if (value != null) {
            controller.changeDate(value) ;
          }
        }):
           showTimePicker(
               context: context,
               initialTime: TimeOfDay.fromDateTime(DateTime.now()),
           ).then((value){
               if (value != null) {
         controller.changeTime(value) ;
       }}
           );

      },
    );
  }
}
