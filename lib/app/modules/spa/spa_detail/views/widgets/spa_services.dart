import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_images_Widget.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_info_widget.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_prices_widget.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_packages_widget.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_service_widget.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_services.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/spa_reservation_price.dart';
import 'package:easy_hotel/app/components/review_List_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bar_widget.dart';
import 'filter_bar.dart';


class SpaServices extends GetView<SpaDetailsController> {
  const SpaServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  const EdgeInsets.fromLTRB(20,5,20,5),
          child: Container(
            decoration:const  BoxDecoration(
              color: AppColors.appHallsRed,
              borderRadius: BorderRadius.all( Radius.circular(10)),
            ),
            child:  Row(
              children: const[
                 BarWidgets( title: AppStrings.services,index:0,),
                 BarWidgets( title: AppStrings.packages,index: 2,),
              ],),
          ),
        ),

        Obx((){
          return [
            const SpaReservationPriceWidget(),
            const SpaReservationServicesWidget(),
            const SpaReservationPackageWidget(),
          ][controller.serviceIndex.value];
        })
      ],
    );
  }

}
