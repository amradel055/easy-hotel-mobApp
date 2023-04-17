import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pageIndex = controller.pageIndex.value;
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              // BottomNavigationBarItem(icon: Icon(Icons.home,), label: '' ,  tooltip: AppStrings.home),
              BottomNavigationBarItem(icon: Icon(Icons.room_service), label: '' , tooltip: AppStrings.allServices),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle,), label: "" , tooltip: AppStrings.myAccount),
            ],
            onTap: (index) => controller.changeView(index),
            currentIndex:pageIndex ,
            iconSize: 24,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
          ),
          body: controller.pages[pageIndex]
    ,
    );
  });
  }
}
