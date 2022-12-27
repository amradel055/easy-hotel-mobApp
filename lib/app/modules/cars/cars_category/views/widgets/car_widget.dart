import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../../components/text_widget.dart';
import '../../../../../core/values/app_colors.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({Key? key , required this.car}) : super(key: key);
  final CarsResponse car ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.carsOrder , arguments: car);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color:   Colors.red[900]! , width: size.width * 0.005),
            borderRadius: BorderRadius.circular(size.width * 0.05)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: size.height * 0.25,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    color: AppColors.appGreyLight,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(size.width * 0.05) , topRight:  Radius.circular(size.width * 0.05))
                ),
                child:
                // car.image != null ?
                FadeInImage(
                  height: size.height * 0.25,
                  width: size.width * 0.9,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                  image:  NetworkImage( "${ApiProvider.apiUrl}/restaurantItem/itemImage/${car.image}" ) ,
                  imageErrorBuilder: (context, error, StackTrace) {
                    return Image(
                        height: size.height * 0.25,
                        width: size.width,
                        fit: BoxFit.contain,
                        image: const AssetImage("assets/images/placeholder.jpeg")
                    );
                  },)
              // : const SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 9,
                    child:
                    Center(
                      child: TextWidget(car.name! ,
                        textColor: Colors.red[900]! , maxLines: 1, size: 20, weight: FontWeight.bold,),
                    ),
                ),
                Expanded(
                    flex: 9,
                    child:
                    TextWidget( "${car.pricePerDay!.toString()+AppStrings.LE}" ,
                      textColor:Colors.blue , maxLines: 1, weight: FontWeight.bold, size: 20,),
                ),
                Expanded(
                    flex: 9,
                    child:
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget("seats" , textColor: Colors.blue , maxLines: 1,),
                          Icon(Icons.person , color:Colors.blue , size: size.width * 0.08,),
                          TextWidget(car.seatsNumber.toString(), textColor : Colors.blue , maxLines: 1, size: 20,),
                          const TextWidget("+" ,textColor:Colors.blue ),
                        ],
                      ),
                    ),

                ),
                Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(3.toString(),textColor: Colors.black, size: 20,),
                        Icon(Icons.star_rounded,color: Colors.amber, size: 20,)
                      ],
                    )),
                // const Expanded(
                //   child: Align(
                //     alignment: AlignmentDirectional.bottomEnd,
                //     child: TextWidget(
                //       "40-50 ",
                //       size: 11,
                //       textColor: Colors.white,
                //       weight: FontWeight.bold,
                //       children: [TextWidget(AppStrings.minutes)],
                //     ),
                //   ),
                // ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     TextWidget(car.name! ,
            //       textColor: Colors.red[900]! , maxLines: 1, size: 15, weight: FontWeight.bold,),
            //     TextWidget( "${car.pricePerDay!.toString()+AppStrings.LE}" ,
            //       textColor:Colors.blue , maxLines: 1, weight: FontWeight.bold,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     SizedBox(
            //       width: size.width*.8,
            //       height: size.height*.01,
            //       child: RatingBar.builder(
            //         initialRating: 3,
            //         minRating: 1,
            //         direction: Axis.horizontal,
            //         ignoreGestures: true,
            //         allowHalfRating: true,
            //         itemCount: 5,
            //         itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            //         itemBuilder: (context, _) => const Icon(
            //           Icons.star,
            //           color: Colors.amber,
            //         ),
            //         onRatingUpdate: (rating) {
            //         },
            //       ),
            //     ),
            //
            //     SizedBox(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           const TextWidget("seats" , textColor: Colors.blue , maxLines: 1,),
            //           Icon(Icons.person , color:Colors.blue , size: size.width * 0.05,),
            //           TextWidget(car.seatsNumber.toString(), textColor : Colors.blue , maxLines: 1,),
            //           const TextWidget("+" ,textColor:Colors.blue ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),


            // SizedBox(
            //   width: size.width * 0.45,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //           height: size.height * 0.03,
            //           child: OutlinedButton(
            //             onPressed: (){
            //               // Navigator.push(context, MaterialPageRoute(builder: (context) => CarsDetails(car)));
            //             },
            //             style: ButtonStyle(
            //                 shape: MaterialStateProperty.all(const RoundedRectangleBorder(side: BorderSide(color: Colors.black)))
            //             ),
            //             child: TextWidget("More info" , textColor: Colors.red[900]! , weight: FontWeight.bold,),
            //           )),
            //       SizedBox(
            //           height: size.height * 0.03,
            //           width: size.width * 0.19,
            //           child: OutlinedButton(
            //             onPressed: (){
            //               Get.toNamed(Routes.carsOrder , arguments: car);
            //             },
            //             style: ButtonStyle(
            //                 backgroundColor: MaterialStateProperty.all(Colors.red[900]!)
            //             ),
            //             child: const TextWidget("Book" ,
            //               textColor: Colors.white, weight: FontWeight.bold,),
            //           )
            //       ),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
