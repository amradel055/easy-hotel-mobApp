
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/views/widgets/image.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/themes/app_text_theme.dart';
import 'full_screen_image.dart';


class SpaImagesShow extends GetView<SpaDetailsController> {
  const SpaImagesShow( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  SizedBox(
        height: size.height * 0.6,
        child:  GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemCount: controller.spa!.itemImages!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return  GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>  FullScreenImage(image:'${ApiProvider.imageUrl}${controller.spa!.itemImages![index].image}',) ));
              },
              child: SpaImage(
                  image: "${ApiProvider.imageUrl}${controller.spa!.itemImages![index].image!}"
              ),
            );
          },

        )



    );
  }

}
