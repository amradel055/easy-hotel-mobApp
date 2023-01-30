import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/products_fav_manager.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/controllers/fav_products_controller.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/views/widgets/product_widget.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavProductsView extends GetView<FavProductsController> {
  const FavProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
              child: FavProductsManager().favouriteProducts.isEmpty
                  ? _emptyWidget(size)
                  : _buildBody(size)
          ),
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

  Widget _buildBody(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < FavProductsManager().favouriteProducts.length; i++)
          SizedBox(
              width: size.width,
              child: ProductCard(
                size,
                FavProductsManager().favouriteProducts[i],
                FavProductsManager().favouriteProducts[i].fav!.value,
                "1",
                null,
                false,
              ))
      ],
    );
  }
}
