
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SpaReservationServices extends GetView<SpaDetailsController> {
  const SpaReservationServices(this.name, this.groupName, this.image, {Key? key}) : super(key: key);
  final String ?name;
  final String ?groupName;
  final String ?image;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(5),
          child: Container(
              height: size.height*.1,
              width: size.width*.9,
              decoration: const BoxDecoration(
                color: AppColors.appGreyDark,
                borderRadius: BorderRadius.all( Radius.circular(10)),
              ),
              child:Row(
                children: [
                  ImageWidget(path: image! ,height:  size.height * 0.1,
                    fit: BoxFit.cover,
                    width: size.width * 0.2,),
                  Padding(
                      padding:const  EdgeInsets.only(left: 20,top: 8,right: 20),
                      child: SizedBox(
                        width: size.width*.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(name!,weight: FontWeight.bold),
                            TextWidget(groupName! ,weight: FontWeight.bold)

                          ],
                        ),
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.serviceIndex.value=0;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height:size.height * 0.06 ,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all( Radius.circular(size.width * 0.05)),
                        ),
                        child: const Center(child:  TextWidget(AppStrings.show , textAlign: TextAlign.center,weight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              )
          ),
        )


      ],)
    ;
  }

}
