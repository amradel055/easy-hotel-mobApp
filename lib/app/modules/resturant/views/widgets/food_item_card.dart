import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_mini_response.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/provider/api_provider.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({Key? key , required this.item}) : super(key: key);
  final ItemMiniResponse item ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.toNamed(Routes.FOOD_ITEM , arguments: item.id),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black87,
        child: SizedBox(
          width: double.infinity,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: ImageWidget(
                    path: ApiProvider.imageUrl + item.image.toString(),
                    elevation: 3,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: TextWidget(
                              item.name!,
                              weight: FontWeight.bold,
                              maxLines: 1,
                              size: 16,
                              textColor: Colors.black,
                            )),
                            SizedBox(
                              width: 50,
                              child: IconButtonWidget(
                                icon: Icons.favorite_border_rounded,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 TextWidget(
                                   item.price.toString(),
                                   textAlign: TextAlign.justify,
                                   maxLines: 1,
                                   textColor:item.salePrice != null ? Colors.black45 :Colors.black,
                                   weight: FontWeight.bold,
                                   size: 16,
                                   showInline: item.salePrice != null,

                                 ),
                                 item.salePrice!= null ?  Padding(
                                   padding: const EdgeInsets.all(3.0),
                                   child: TextWidget(
                                       item.salePrice.toString(), showInline: false, textColor: Colors.black ,  weight: FontWeight.bold,
                                     size: 16,),
                                 ): const SizedBox(),
                                 const Padding(
                                   padding: EdgeInsets.all(3.0),
                                   child: TextWidget(AppStrings.LE, textColor: Colors.black , weight: FontWeight.bold,
                                     size: 16,),
                                 ),

                               ],
                             ),
                            SizedBox(
                              width: 50,
                              child: IconButtonWidget(
                                icon: Icons.add_shopping_cart,
                                iconSize: 25,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
