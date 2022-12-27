import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HallsSearchCardWidget extends StatelessWidget {
  const HallsSearchCardWidget({Key? key, required this.type, required this.image, required this.title, required this.subtitle, required this.id}) : super(key: key);
  final int type;
  final int id;
  final String? image;
  final String title ;
  final String subtitle ;



  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(
      onTap:(){
        if(type == 0) {
          Get.toNamed(Routes.CITY_HALLS,arguments: id);
        } else if(type == 1) {
          Get.toNamed(Routes.HALLS  ,arguments: id);
        } else {
          Get.toNamed(Routes.HALL_DETAILS, arguments: id);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(
          children: [
            ImageWidget(path:ApiProvider.imageUrl + image.toString(), width: size.width*.15,height: size.height*.07),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(title,size: 15.h,weight:FontWeight.bold,),
                    TextWidget(subtitle,size: 15.h,),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(0,0,10.h,0),
              child: Icon(Icons.hide_source,color: Colors.grey[500],),
            )
          ],
        ),
      ),
    );

  }
}