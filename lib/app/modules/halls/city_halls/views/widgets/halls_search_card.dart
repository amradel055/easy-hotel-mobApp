import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HallsCardWidget extends StatelessWidget {
  const HallsCardWidget({Key? key, required this.type, required this.image, required this.title, required this.subtitle, required this.id, this.onTap, required this.price, required this.rate}) : super(key: key);
  final int type;
  final int id;
  final String? image;
  final String title ;
  final String subtitle ;
  final String price ;
  final String rate ;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(
      onTap:(){Get.toNamed(Routes.HALL_DETAILS,arguments: id);},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Container(
            width: size.width*.9,
            height: size.height*.26,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                color: AppColors.appGreyDark),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  SizedBox(
                    height: size.height * 0.2,
                    width: size.width * 0.9,
                    child: ImageWidget(
                      path: ApiProvider.imageUrl + image.toString(),
                    ),
                  ),
                  // PositionedDirectional(
                  //   top: 0,
                  //   end: 0,
                  //   child: Container(
                  //     decoration:
                  //     BoxDecoration(borderRadius: const BorderRadiusDirectional.only(bottomStart: Radius.circular(AppConstants.radius)), color: Colors.red.withOpacity(.8)),
                  //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  //     child:  TextWidget(
                  //       AppStrings.sale,
                  //       textDirection: TextDirection.rtl,
                  //       textColor: Colors.white,
                  //       weight: FontWeight.bold,
                  //       children: [TextWidget(" 15 "), TextWidget("%"), TextWidget(" - "), TextWidget(price), TextWidget("LE")],
                  //     ),
                  //   ),
                  // ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextWidget(
                                title,
                                maxLines: 1,
                                textColor: Colors.white,
                                weight: FontWeight.bold,
                                size: 20,
                              )
                          ),

                          // const Expanded(
                          //   child: Align(
                          //     alignment: AlignmentDirectional.bottomEnd,
                          //     child: TextWidget(
                          //       "40 فرد ",
                          //       size: 11,
                          //       textColor: Colors.white,
                          //       weight: FontWeight.bold,
                          //       children: [TextWidget(AppStrings.minutes)],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )



                ])     ,
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,0,5,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(subtitle,weight: FontWeight.bold,size: 17,
                          ),
                          SizedBox(
                            width: size.width * 0.12,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.star_rounded,color: Colors.yellow,),
                                  TextWidget(rate,textColor: Colors.black, size: 16, weight: FontWeight.bold,),
                                ],
                              ),
                            ),
                          ),
                        ],),

                    ],
                  ),
                ),

              ],
            )
            ,
          ),
        ),
      ),
    );

  }
}