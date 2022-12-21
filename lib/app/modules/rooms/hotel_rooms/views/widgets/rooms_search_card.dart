import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RoomsCardWidget extends StatelessWidget {
  const RoomsCardWidget({Key? key, required this.price, required this.image, required this.title, required this.subtitle, required this.id, this.onTap}) : super(key: key);
  final num price;
  final int id;
  final String image;
  final String title ;
  final String subtitle ;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(onTap: (){
      Get.toNamed(Routes.ROOM_DETAIL,arguments:id );     },
      child: Column(
        children: [


          Padding(
            padding:  EdgeInsets.fromLTRB(size.width*.05, size.height*.005, size.width*.05, size.height*.005),
            child: Container(
              height: size.height*.2,
              width: size.width*.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.appGreyDark,
              ),


              child:Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                    children: [
                      Container(
                        height:  size.height * 0.2,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                   AppAssets.rooms)
                            )
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(width: size.width*.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:   [
                              Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(subtitle,style: TextStyle(color: Colors.grey,fontSize: 12),),
                              Text("${price}LE/night",style: TextStyle(color: Colors.grey,fontSize: 10)),
                              RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  ignoreGestures: true,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: AppColors.appBlue,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  }),
                              Expanded(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("17.900view",style: TextStyle(color: Colors.grey,fontSize: 10)),
                                    Container(
                                      child: Container(alignment: Alignment.centerRight,

                                        height: size.height*.04,
                                        width: size.width*.19,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all( Radius.circular(20.00)),color: AppColors.appBlue,
                                        ),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                                              child: Center(child: TextWidget(AppStrings.reserve,weight: FontWeight.bold,textColor: Colors.white, )),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}