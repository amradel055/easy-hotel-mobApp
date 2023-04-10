import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/products_fav_manager.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/controllers/fav_products_controller.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/views/widgets/product_widget.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/views/widgets/products_list.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/custom_card.dart';
import '../../../../core/utils/common.dart';
import '../../../../core/values/app_constants.dart';
import '../../../../data/model/app_services/dto/response/application_response_dto.dart';

class FavProductsView extends GetView<FavProductsController> {
  const FavProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
          "Favorite",
          // style: titleTextStyleBold(size),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Obx(() {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: controller.isLoading.value == true
                  ? Center(
                      child: Common.getSpin(),
                    )
                  : _buildBody(size, context)),
        );
      }),
    );
  }

  _emptyWidget(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(249, 249, 249, 1),
        // borderRadius:
        //     BorderRadius.vertical(top: Radius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Favorite Products Yet',
            style: TextStyle(
                fontFamily: 'Mont',
                color: Colors.grey[600],
                fontSize: 22,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget _buildBody(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BoxWidget(
          height: 50,
          width: size.width - (AppConstants.padding * 2),
          margin: const EdgeInsets.fromLTRB(
              AppConstants.padding, 10, AppConstants.padding, 0),
          shadowColor: Colors.transparent,
          radius: AppConstants.radius,
          color: Colors.transparent,
          borderColor: AppColors.grey,
          borderWidth: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                // controller: controller.tabController,
                // unselectedLabelColor: Colors.white.withOpacity(0.5),
                // labelColor: Theme.of(context).primaryColor,
                // indicatorColor: Colors.transparent,
                // indicatorWeight: 00.1,
                // // padding: const EdgeInsets.fromLTRB(
                // //     AppConstants.padding, 10, AppConstants.padding, 0),
                // // labelPadding: const EdgeInsets.fromLTRB(
                // //     AppConstants.padding, 10, AppConstants.padding, 0),
                // onTap: (value) {},
                children: [
                  for (int i = 0; i < controller.appServicesList.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                        color: controller.selectedAppId.value == controller.appServicesList[i].applications ? AppColors.restaurantThirdColor : AppColors.restaurantSecondColor,
                        borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20 ,5.0 , 20 , 5),
                          child: TextWidget(
                            textColor: Colors.black,
                            maxLines: 1,
                            controller.appServicesList[i].applicationName ?? "",
                            size: 18,
                            textAlign: TextAlign.center,
                            weight: FontWeight.bold,
                            onTap: () => controller.selectedAppId(
                                controller.appServicesList[i].applications ??
                                    0),
                          ),
                        ),
                      ),
                    )
                ]),
          ),
        ),
        const ProductsCardListFav()
      ],
    );
  }
}
