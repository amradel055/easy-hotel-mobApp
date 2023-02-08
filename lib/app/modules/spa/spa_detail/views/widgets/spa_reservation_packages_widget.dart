
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_package.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_price.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';


class SpaReservationPackageWidget extends GetView<SpaDetailsController> {
  const SpaReservationPackageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Stack(alignment: Alignment.bottomCenter,
      children: [SizedBox(
        height: size.height * 0.57,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              for(int i = 0 ; i <controller.spa!.offersDTOList!.length ; i++)
                SpaReservationPackage(controller.spa!.offersDTOList![i].name! , controller.spa!.offersDTOList![i].name! , controller.spa!.offersDTOList![i].image , controller.spa!.offersDTOList![i].offersDetailsDTOList![0].spaItemId,i.obs )
            ],
          ),
        ),
      ),Positioned(top: size.height*.55,
        child: GestureDetector(
          onTap: (){
          },
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0, size.height*.05, 0, size.height*.03),
            child: Container(
              height:size.height * 0.05 ,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: AppColors.appHallsRedDark,
                borderRadius: BorderRadius.all( Radius.circular(size.width * 0.05)),
              ),
              child:const TextWidget(AppStrings.reserve , textAlign: TextAlign.center,weight: FontWeight.bold,textColor: Colors.white,),
            ),
          ),
        ),
      ),


      ],
    )
    ;
  }

}
