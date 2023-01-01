import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/image_widget.dart';
import '../../controllers/resturant_controller.dart';

class SlidersWidget extends GetView<RestaurantController> {
  const SlidersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.loading.value == true){
        return SizedBox(
            height: 150,
            child: Common.getSpin());
      }
      return Transform.scale(
        scaleX: 1.1,
        child: CarouselSlider.builder(
          itemCount: controller.sliderList.value.length,
          options: CarouselOptions(
            height: controller.sliderList.value.isNotEmpty ?150 :0.0,
            viewportFraction: 0.85,
            enableInfiniteScroll: true,
            pageSnapping: true,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, _) {
            return  ImageWidget(path:ApiProvider.imageUrl + controller.sliderList.value[index].imgUrl.toString(), fit: BoxFit.fill,);
          },
        ),
      );
    });
  }
}
