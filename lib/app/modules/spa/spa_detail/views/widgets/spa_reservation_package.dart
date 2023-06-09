
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/themes/app_theme.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SpaReservationPackage extends GetView<SpaDetailsController> {
  const SpaReservationPackage(this.name, this.title,this.image , this.offerItemId, this.index , {Key? key}) : super(key: key);
  final String name;
  final String title;
  final String? image ;
  final int? offerItemId ;
  final RxInt? index ;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top:5, bottom: 10),
      child: Container(
        width: size.width*.9,
        height: size.height*.3,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.00)),color: AppTheme.isDark?Colors.grey[800]:AppColors.appGreyDark
        ),
        child: Column(
          children:[
              ImageWidget(path:image != null ? ApiProvider.imageUrl + image! : AppAssets.placeHolderImg,width: size.width*.9,
              height: size.height*.18, fit: BoxFit.cover,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(name,weight: FontWeight.bold),
                      TextWidget(title,weight: FontWeight.bold),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:5, right:10 , top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.getOfferItems(offerItemId!,index!);
                          controller.serviceIndex.value=0;

                        },
                        child: Container(
                          height:size.height * 0.07 ,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color:AppColors.appHallsRedDark ,
                            borderRadius: BorderRadius.all( Radius.circular(size.width * 0.05)),
                          ),
                          child:const Center(child:  TextWidget(AppStrings.reserve , textAlign: TextAlign.center,weight: FontWeight.bold,)),
                        ),
                      ),
                       // TextWidget('$price LE',weight: FontWeight.bold)

                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    )
    ;
  }

}
