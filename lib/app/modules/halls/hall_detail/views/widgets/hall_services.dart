import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';

class HallServices extends StatelessWidget {
  const HallServices({Key? key, required this.image, required this.name}) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: size.width * .2,
        height: size.height * .06,
        decoration:const  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              10.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.1,
              child: ImageWidget(
                path: ApiProvider.imageUrl + image,
              ),
            ),
            SizedBox(
              width: size.width*0.2,
              child: Center(
                child: TextWidget(
                  name,
                  maxLines: 1,
                  weight: FontWeight.bold,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
