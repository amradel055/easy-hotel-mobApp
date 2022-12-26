import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/allServices/services_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key, required this.serviceModel}) : super(key: key);
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(serviceModel.pageRoute!),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.00)),
            color: AppColors.appGreyLight,
            image: DecorationImage(
                image: AssetImage(serviceModel.image!), fit: BoxFit.cover)),
        clipBehavior: Clip.antiAlias,
        child: DecoratedBox(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextWidget(
                    serviceModel.name!,
                    textColor: Colors.white,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    size: 17,
                  ),
                ))),
      ),
    );
  }
}
