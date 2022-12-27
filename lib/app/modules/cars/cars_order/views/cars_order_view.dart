import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/cars/cars_order/controllers/cars_order_controller.dart';
import 'package:easy_hotel/app/modules/cars/cars_order/views/widgets/cars_order_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CarsOrderView extends GetView<CarsOrderController> {
  const CarsOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CarsOrderAppbar(size.height * 0.4),
      body: Obx((){
        if(controller.loading.value == true){
          return Common.getSpin();
        }
        return  Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: size.height * 0.65,
              width: size.width,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextWidget(
                      "كم عدد الاشخاص ؟",
                      textColor: Colors.blue,
                      size: 17,
                      weight: FontWeight.bold,
                    ),
                    Obx(() => Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.width * 0.03), color: AppColors.appRedLight),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                              child: Column(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 1,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: controller.selectedCar.seatsNumber!,
                                    itemSize: size.width * 0.1,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.person,
                                      color: Colors.redAccent,
                                    ),
                                    onRatingUpdate: (value) => controller.changeSelectedPersonNumber(value.toInt()),
                                  ),
                                  TextWidget(
                                    "${controller.selectedPersonsNumber.value}" + " اشخاص",
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    const TextWidget(
                      'الملاحظات..',
                      weight: FontWeight.bold,
                      textColor: Colors.blue,
                      size: 20,
                    ),

                    SizedBox(
                      height: 100,
                      width: size.width*.9,

                      child: TextFieldWidget(
                        maxLines: 5,
                        controller:controller.remark,
                        onChange: (value) => controller.remark.text = value,

                      ),
                    ),
                    const TextWidget(
                      "نوع السياره التي تم اختيارها",
                      textColor: Colors.blue,
                      size: 17,
                      weight: FontWeight.bold,
                    ),
                    TextWidget(
                      controller.selectedCar.name!,
                      textColor: Colors.red[900]!,
                      size: 17,
                      weight: FontWeight.bold,
                    ),
                    Container(
                      width: size.width * .9,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.11,
                            height: size.height * 0.1,
                            child: Center(
                              child: Checkbox(
                                activeColor: Colors.red[900],
                                value: true,
                                onChanged: (bool? value) {},
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.38,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  controller.selectedCar.name!,
                                  textColor: Colors.red[900]!,
                                  maxLines: 1,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                                TextWidget(
                                  controller.selectedCar.pricePerDay!.toString() + AppStrings.LE,
                                  textColor: Colors.blue,
                                  maxLines: 1,
                                  weight: FontWeight.bold,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: size.width * 0.45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const TextWidget(
                                        "seats",
                                        textColor: Colors.blue,
                                        maxLines: 1,
                                        weight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                        size: size.width * 0.05,
                                      ),
                                      TextWidget(
                                        "${controller.selectedCar.seatsNumber}",
                                        textColor: Colors.blue,
                                        maxLines: 1,
                                        weight: FontWeight.bold,
                                        size: 15,
                                      ),
                                      const TextWidget(
                                        "+",
                                        textColor: Colors.blue,
                                        maxLines: 1,
                                        weight: FontWeight.bold,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.4,
                              child:
                                  // _car.image != null ?
                                  FadeInImage(
                                height: size.height * 0.15,
                                width: size.width * 0.45,
                                fit: BoxFit.cover,
                                placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                                image: NetworkImage(
                                  ApiProvider.apiUrl + "/restaurantItem/itemImage/" + '${controller.selectedCar.image}',
                                ),
                                imageErrorBuilder: (context, error, StackTrace) {
                                  return Image(
                                      height: size.height * 0.1,
                                      width: size.width,
                                      fit: BoxFit.contain,
                                      image: const AssetImage("assets/images/placeholder.jpeg"));
                                },
                              )
                              // : const SizedBox(),
                              ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppConstants.padding),
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.4,
                              child: OutlinedButton(
                                  onPressed: () {
                                    controller.saveOrder();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                  ),
                                  child: const TextWidget(
                                    AppStrings.reserve,
                                    textColor: Colors.white,
                                    weight: FontWeight.bold,
                                    size: 20,
                                  )),
                            ),
                            // SizedBox(
                            //   child: OutlinedButton(
                            //       onPressed: () {},
                            //       style: ButtonStyle(
                            //         backgroundColor: MaterialStateProperty.all(Colors.white),
                            //       ),
                            //       child: const TextWidget(
                            //         "القائمة الرئيسيه",
                            //         textColor: Colors.redAccent,
                            //         weight: FontWeight.bold,
                            //         size: 20,
                            //       )),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );}),
    );
  }
}
