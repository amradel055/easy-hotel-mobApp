
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingTabWidget extends GetView<SettingTabWidget> {
  const SettingTabWidget(this.icon, this.name,  {Key? key}) : super(key: key);
  final IconData icon;
  final String name;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.edit)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: TextWidget(name?? '' , size: 16, weight: FontWeight.w600,),
            ),


          ],
        ),
      ),
    );

  }
}
