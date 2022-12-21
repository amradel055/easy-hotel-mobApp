import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  const CategoriesWidgets({Key? key, required this.title, required this.image, this.onTap, required this.index}) : super(key: key);
  final String title;
  final String image;
  final Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      image),
                  radius: 20.00,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    title,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
      ),
    );

  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('onTap', onTap));
  }
}
