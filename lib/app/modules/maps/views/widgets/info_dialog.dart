

import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key , required this.title ,  required this.image});
  final String title ;
  final String image ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: SizedBox(
        height: size.height * 0.2,
        width: size.width* 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(title , size: 18, weight: FontWeight.bold,),
             SizedBox(
              height: size.height * 0.15 ,
              width: size.width* 0.8,
              child: Image.network(image ,errorBuilder: (context, error, stackTrace) =>const Text("image error"), fit: BoxFit.fill),
             )
        ]),
      ),
    );
  }
}