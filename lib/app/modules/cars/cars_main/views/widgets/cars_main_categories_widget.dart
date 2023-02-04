import 'package:easy_hotel/app/data/model/cars/dto/response/cars_groups_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import '../../../../../components/text_widget.dart';
import '../../../../../core/values/app_colors.dart';
import 'package:get/get.dart';
class CarsMainCategoryWidget extends StatelessWidget {
  const CarsMainCategoryWidget({Key? key , required this.carsGroup, required this.image}) : super(key: key);
  final CarsGroupsResponse carsGroup ;
  final String image ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.carsCategory , arguments: [carsGroup.id,image]);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color:   AppColors.appGreyLight , width: size.width * 0.01),
            borderRadius: BorderRadius.circular(size.width * 0.05)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.1,

              decoration:   BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          ApiProvider.imageUrl+image
                      ),
                      fit: BoxFit.fitWidth,
                  ),
                shape: BoxShape.circle,
              ),

              // decoration: BoxDecoration(
              //      image: AssetImage("imageIn"),
              //   shape: BoxShape.circle,
              // ),
            ),
             TextWidget(
              carsGroup.name! ,
              size: 20,
              textColor: AppColors.black,
               maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
