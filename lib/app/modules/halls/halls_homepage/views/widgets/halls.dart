import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Halls extends StatelessWidget {
  const Halls({Key? key, required this.image, required this.name, required this.id}) : super(key: key);
  final String? image;
  final String name;
  final int id;




  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(onTap: (){
      Get.toNamed(Routes.HALL_DETAILS, arguments: id);
    },
      child: Container(
        width: size.width * .45,
        height: size.height * .2,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              10.0)),

        ),

        child: Column(
          children: [
            Container(
              height: size.height * 0.13,
              width: size.width * 0.4,
              child: ImageWidget(path: ApiProvider.imageUrl + (image ?? ''), fit: BoxFit.cover,),
            ), SizedBox(width: size.width*.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TextWidget(
                      name,
                      maxLines: 2,
                      size: 15,
                      weight: FontWeight.w900,
                    ),
                  ),

                ],),
            )

          ],
        ),
      ),
    );
  }
}
