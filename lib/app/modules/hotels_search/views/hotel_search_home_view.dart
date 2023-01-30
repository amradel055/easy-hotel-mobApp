import 'package:easy_hotel/app/components/button_widget.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/hotels_search/controller/hotel_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/text_field_widget.dart';
import '../../../components/text_widget.dart';
import '../../../core/utils/user_manager.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_strings.dart';
import '../../../routes/app_pages.dart';
import '../../rooms/rooms_homepage/views/widgets/offer_card.dart';
import '../../rooms/rooms_homepage/views/widgets/towns.dart';

class HotelSearchView extends GetView<HotelSearchController> {
  const HotelSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: TextWidget(
            AppStrings.hotelsServices,
            size: 30.h,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.colorLogo,

                      Colors.deepOrange[100]!,
                      Colors.deepOrange[100]!.withOpacity(0.5),
                      Colors.deepOrange[100]!.withOpacity(0.5),
                      // Colors.transparent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: size.height,
          color:  AppColors.colorLogo.withOpacity(0.2),
          padding: EdgeInsets.fromLTRB(size.width * .1, 175.h, size.width * .1, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return SizedBox(
                    width: size.width * .8,
                    child: TextFieldWidget(
                      enabled: false,
                      hint: AppStrings.searchHotelForService,
                      controller: controller.homeSearchController.value,
                      suffixIcon: Icons.search,
                      ltr: true,
                      onTap: () {
                        Get.toNamed(Routes.HOTEL_SEARCH_SEARCH_PAGE);
                      },
                    ));
              }),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * .8,
                child: ButtonWidget(
                  text: AppStrings.enterHotel,
                  fontSize: 17,
                  buttonColor: AppColors.primary,
                  onPressed: () {
                    if(UserManager().selectedBranch != null){
                      Get.toNamed(Routes.ALLSERVICES);
                    }else{
                      showPopupText(AppStrings.searchHotelForService);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
