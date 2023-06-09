import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/themes/app_theme.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../polman/polman_homepage/views/widgets/timer.dart';
import '../controllers/polman_controller.dart';

class PolmanView extends GetView<PolmanController> {
  const PolmanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.white,
          title:  TextWidget(AppStrings.home,size: 30.h,textColor: AppColors.white,),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.black87,
                      Colors.black.withOpacity(.7),
                      Colors.black.withOpacity(.6),
                      Colors.transparent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 250.h,
              decoration:  BoxDecoration(
                  image: DecorationImage(image: AssetImage(controller.res[0]), fit: BoxFit.cover)),

              padding:  EdgeInsets.fromLTRB(40.h, 300.h,40.h, 0),
              child:  Column(
                children: [
                  Center(
                      child: TextWidget(AppStrings.orderpolman,textColor: AppColors.white,size: 30.h,weight: FontWeight.bold,)),
                 ],
              ),


            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(30.h, 0, 30.h, 10.h),
                    child: TextWidget(AppStrings.orderpolman,textAlign: TextAlign.left,weight: FontWeight.bold,size: 20.h,),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20,0,20,0),
                    child: TextWidget(
                      AppStrings.notes,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 100,
                      child: TextFieldWidget(
                        maxLines: 5,
                        controller:controller.remark,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: size.height*.3,
                      child:Column(
                        children: [
                          SizedBox(height: size.height*.2,width: size.width*.9,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(AppStrings.time,weight: FontWeight.bold,size: 20,),
                                Container(width: size.width*.7,height: size.height*.2,
                                    decoration: BoxDecoration(borderRadius:const BorderRadius.all((Radius.circular(15))),color: AppTheme.isDark?Colors.grey[600]:Colors.grey[300],),
                                    child:
                                    const TimerWidget()
                                )
                              ],
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.POLMAN_CHECKOUT,arguments: [controller.remark.text,controller.res[1],controller.dateTime.value]);
                                        },
                                        child: Container(
                                          height:size.height * 0.05 ,
                                          width: size.width * 0.4,
                                          decoration: const BoxDecoration(
                                            color: AppColors.appHallsRedDark,
                                            borderRadius: BorderRadius.all( Radius.circular(5)),
                                          ),
                                          child:Center(child: const TextWidget(AppStrings.reserve , textAlign: TextAlign.center,weight: FontWeight.bold,textColor: AppColors.white,)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          Get.toNamed(Routes.POLMAN_CHECKOUT,arguments: [controller.remark.text,controller.res[1],DateTime.now()]);
                                        },
                                        child: Container(
                                          height:size.height * 0.05 ,
                                          width: size.width * 0.4,
                                          decoration: const BoxDecoration(
                                            color: AppColors.appHallsRedDark,
                                            borderRadius: BorderRadius.all( Radius.circular(5)),
                                          ),
                                          child:Center(child: const TextWidget(AppStrings.reserveNow , textAlign: TextAlign.center,weight: FontWeight.bold,textColor: AppColors.white,)),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ])
          ],
        )
    );
  }
}
