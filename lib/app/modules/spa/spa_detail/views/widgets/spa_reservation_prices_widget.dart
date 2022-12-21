
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_price.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';

class SpaReservationPriceWidget extends GetView<SpaDetailsController> {
  const SpaReservationPriceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(height: size.height*.5,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.42,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    for(int i = 0 ; i < controller.spa!.spaItemsDtoList!.length ; i++)
                      SpaReservationPrice( controller.spa!.spaItemsDtoList![i].name, controller.spa!.spaItemsDtoList![i].price.toString() ,controller.spa!.spaItemsDtoList![i].salePrice ,i.obs)
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:10),
              child: GestureDetector(
                onTap: ()async {
                  controller.getSpaSave();
                },
                child: Container(
                  height:size.height * 0.05 ,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: AppColors.appHallsRedDark,
                    borderRadius: BorderRadius.all( Radius.circular(size.width * 0.05)),
                  ),
                  child:const TextWidget(AppStrings.reserve , textAlign: TextAlign.center,weight: FontWeight.bold,size: 17,textColor: Colors.white,),

                ),
              ),
            ),

          ],
        ),
      ),
    )
    ;
  }

}
