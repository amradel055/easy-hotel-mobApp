import 'package:easy_hotel/app/components/text_widget.dart';
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
          children: [
            Container(
              height: size.height * 0.06,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image),
                  )
              ),
            ),
            SizedBox(
              width: size.width*.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    name,
                    maxLines: 1,
                    weight: FontWeight.bold,
                  ),
                ],),
            )

          ],
        ),
      ),
    );
  }
}
