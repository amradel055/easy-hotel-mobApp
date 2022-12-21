
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/extensions/string_ext.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';


class SpaInfoWidget extends GetView<SpaDetailsController> {
  const SpaInfoWidget(this.discription, this.name, this.town, {Key? key}) : super(key: key);
  final String discription;
  final String name;
  final String town;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(height: size.height*.6,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [ SizedBox( width: size.width*.9,
                  child: ReadMoreText(
                    discription,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    style: AppTextTheme.contentTextStyle,
                    trimCollapsedText: AppStrings.readmore,
                    trimExpandedText: AppStrings.readless,
                    moreStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey),
                  )

              )


              ],

            ),
          ),
            Column(
              children: [
                SizedBox(width: size.width*.8,
                    child:  TextWidget(AppStrings.workhours ,textAlign: TextAlign.start,weight: FontWeight.w900 , size: size.width *0.045 ,)),
                for(WorkHoursDtosModel workHour in controller.spa!.workHoursDTOs!)
                SizedBox(width: size.width*.9,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 5.00,
                        backgroundColor: Colors.green,
                      )
                      ,
                      TextWidget(workHour.fromDate!,weight: FontWeight.bold, ),
                      const TextWidget(":",weight: FontWeight.bold,),
                      TextWidget(workHour.toDate!,weight: FontWeight.bold, ),
                      SizedBox(width: size.width*.2,),
                      TextWidget(workHour.fromHour!.timeStringFromDateString,weight: FontWeight.bold,),
                      const TextWidget(":",weight: FontWeight.bold,),
                      TextWidget(workHour.toHour!.timeStringFromDateString,weight: FontWeight.bold,)
                    ],
                  ),
                ),
                // SizedBox(
                //   width: size.width*.9,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       const CircleAvatar(
                //         radius: 5.00,
                //         backgroundColor: Colors.green,
                //       ),
                //       TextWidget(controller.spa!.workHoursDTOs![0].toDate!,weight: FontWeight.bold,),
                //       SizedBox(width: size.width*.2,),
                //       TextWidget(controller.spa!.workHoursDTOs![0].toHour!,weight: FontWeight.bold,)
                //     ],
                //   ),
                // )
              ],),
            SizedBox(
              width: size.width*.8,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextWidget(AppStrings.address,weight: FontWeight.w900 , size: size.width *0.045 ,),
                  TextWidget(name,weight: FontWeight.bold,),
                  TextWidget(town,weight: FontWeight.bold,),
                  Row(
                    children: [
                      Icon(Icons.directions ,size: size.width*.1,color:AppColors.appHallsRedDark,),
                      TextWidget(AppStrings.directions,weight: FontWeight.w900 , size: size.width *0.045 ,)
                    ],
                  )


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: (){
                  controller.index.value=1;

                },
                child: Container(
                  height:size.height * 0.05 ,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: AppColors.appHallsRedDark,
                    borderRadius: BorderRadius.all( Radius.circular(size.width * 0.05)),
                  ),
                  child: const TextWidget(AppStrings.reserve , textAlign: TextAlign.center,weight: FontWeight.bold,textColor: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

