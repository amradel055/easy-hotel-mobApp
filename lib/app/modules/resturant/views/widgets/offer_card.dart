import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/restaurant/dto/response/item_mini_response.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key , required this.item}) : super(key: key);
  final ItemMiniResponse item ;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: LayoutBuilder(
        builder: (context,c) {
          final w = c.maxWidth;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius),
            ),
            clipBehavior: Clip.antiAlias,
            // width: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                    child: ImageWidget(
                  path: ApiProvider.imageUrl + item.image.toString(),
                  fit: BoxFit.fill,
                  backgroundColor: Colors.black12,
                )),
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: const BorderRadiusDirectional.only(bottomStart: Radius.circular(AppConstants.radius)), color: Colors.red.withOpacity(.8)),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: TextWidget(
                      AppStrings.sale,
                      size: w * .05,
                      textDirection: TextDirection.rtl,
                      textColor: Colors.white,
                      weight: FontWeight.bold,
                      children: [TextWidget(item.salePrice != null ? item.salePrice!.toString()  : item.price != null ? item.price!.toString() : ""), TextWidget( "LE" )],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                            child: TextWidget(
                          item.name!,
                          maxLines: 1,
                          size: w * .06,
                          textColor: Colors.white,
                          weight: FontWeight.bold,
                        )),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(item.reviewsStars != null ? item.reviewsStars.toString() : "0" ,textColor: Colors.white,size: w * .05),
                                Icon(Icons.star_rounded,color: Colors.white,size: w * .08)
                              ],
                            )),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: TextWidget(
                              item.time != null ? item.time.toString() : "",
                              size: w * .05,
                              textColor: Colors.white,
                              weight: FontWeight.bold,
                              children: const [TextWidget(AppStrings.min)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
