import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_hotel/app/components/additions_dialog.dart';
import 'package:easy_hotel/app/components/dropdown_widget.dart';
import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/review_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/resturant/views/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/food_item_controller.dart';

class FoodItemView extends GetView<FoodItemController> {
  const FoodItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كفته'),
        // centerTitle: true,
        actions: [
          UnconstrainedBox(
            child: IconButtonWidget(
              icon: Icons.favorite_border_rounded,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CarouselSlider.builder(
                itemCount: 5,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  pageSnapping: true,
                  // enlargeCenterPage: true,
                ),
                itemBuilder: (context, _, index) {
                  return ImageWidget(path: AppAssets.restraunt, fit: BoxFit.fill, width: context.width, radius: 0);
                },
              ),
              PositionedDirectional(
                end: 10,
                bottom: -20,
                height: 40,
                width: 100,
                child: Container(
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        icon: Icons.remove,
                        iconSize: 15,
                        iconColor: Colors.white,
                        onPressed: () => controller.decrement(),
                      ),
                      Obx(() {
                        return TextWidget("${controller.count.value}", weight: FontWeight.bold, textColor: Colors.white);
                      }),
                      IconButtonWidget(
                        icon: Icons.add,
                        iconSize: 15,
                        iconColor: Colors.white,
                        onPressed: () => controller.increment(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: AppConstants.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  AppStrings.description,
                  weight: FontWeight.bold,
                  children: [TextWidget(":")],
                ),
                const TextWidget(
                    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                    height: 1.5),
                const Divider(height: 10),
                const TextWidget(
                  AppStrings.moreInformation,
                  weight: FontWeight.bold,
                  children: [TextWidget(":")],
                ),
                for (int i = 0; i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(child: TextWidget("النوع", children: [TextWidget(":")])),
                        Expanded(
                          child: DropDownWidget(
                            isDense: true,
                            onChanged: (value) {},
                            items: ["test1", "test2"].map((e) => DropdownMenuItem(child: TextWidget(e), value: e)).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                const Divider(height: 10),
                Row(
                  children: [
                    const TextWidget(
                      AppStrings.deliveryTime,
                      weight: FontWeight.bold,
                      children: [TextWidget(":")],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.input,
                          minuteLabelText: AppStrings.minutes.tr,
                          hourLabelText: AppStrings.hour.tr,
                          cancelText: AppStrings.cancel.tr,
                          confirmText: AppStrings.ok.tr,
                          helpText: AppStrings.enterTime.tr,
                        );
                      },
                      child: TextWidget(AppStrings.sap, showUnderline: true),
                    )
                  ],
                ),
                const Divider(height: 10),
                Row(
                  children: [
                    const TextWidget(
                      AppStrings.additions,
                      weight: FontWeight.bold,
                      children: [TextWidget(":")],
                    ),
                    const Spacer(),
                    IconButtonWidget(
                      icon: Icons.add,
                      onPressed: () => Get.dialog(AdditionsDialog()),
                      padding: EdgeInsets.zero,
                    )
                  ],
                ),
                const Divider(height: 5),
                const TextWidget(
                  AppStrings.relatedItems,
                  weight: FontWeight.bold,
                  children: [TextWidget(":")],
                ),
                const SizedBox(height: 5),
                Transform.scale(
                  scaleX: 1.1,
                  child: SizedBox(
                    height: 110,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        // return const OfferCard();
                      },
                    ),
                  ),
                ),
                const Divider(height: 10),
                const TextWidget(
                  AppStrings.reviews,
                  weight: FontWeight.bold,
                  children: [TextWidget(":")],
                ),
                const SizedBox(height: 5),
                // for (int i = 0; i < 2; i++)
                  // const ReviewWidget(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 45,
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstants.radius)),
            boxShadow: [BoxShadow(color: Theme
                .of(context)
                .shadowColor, offset: const Offset(0, 0), spreadRadius: 5, blurRadius: 8)
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextWidget(
                "150.0 ",
                height: 1,
                weight: FontWeight.bold,
                size: 16,
                children: [TextWidget(AppStrings.LE)],
              ),
              const Spacer(),
              IconButtonWidget(
                icon: Icons.add_shopping_cart_rounded,
                iconSize: 20,
                onPressed: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}
