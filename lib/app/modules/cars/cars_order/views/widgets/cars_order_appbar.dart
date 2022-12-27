import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_traffic_lines_response.dart';
import 'package:easy_hotel/app/modules/cars/cars_order/controllers/cars_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/text_widget.dart';
import '../../../../../core/values/app_strings.dart';
import 'cars_order_time_picker.dart';

class CarsOrderAppbar extends GetView<CarsOrderController> implements PreferredSizeWidget {
  const CarsOrderAppbar(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(size.width * 1, size.width * 0.3), bottomRight: Radius.elliptical(size.width * 1, size.width * 0.3))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 0.01, size.height * 0.03, size.width * 0.04, size.height * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: size.width * 0.06,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: size.width * 0.06,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.width * 0.01, 0, size.width * 0.02, 0),
                            child: Container(
                              height: size.height * 0.04,
                              width: size.width * 0.3,
                              color: Colors.white,
                              child: const Center(
                                  child: TextWidget(
                                "نقل من و الي المطار",
                                size: 14,
                                weight: FontWeight.bold,
                              )),
                            ),
                          ),
                          const Center(
                              child: TextWidget(
                            "تآجير السيارات",
                            textColor: Colors.white,
                            size: 14,
                            weight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Obx(() => Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownSearch<CarsTrafficLinesResponse>(

                            // showSearchBox: true,
                            items: controller.trafficLines,
                            itemAsString: (e) => e.lineName.toString(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,




                            ),
                            onChanged: (value) => controller.changeSelectedTrafficLines(value!),
                            selectedItem: controller.selectedTrafficLine.value,
                          ),
                    )),
                    Obx(() => SizedBox(
                          width: size.width,
                          height: size.height * 0.07,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                child: RadioListTile(
                                  value: 0,
                                  groupValue: controller.selectedTravelType.value,
                                  onChanged: (value) => controller.changeSelectedType(value!),
                                  activeColor: Colors.black,
                                  title: const TextWidget(AppStrings.goingAndReturn , size: 11, weight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: RadioListTile(
                                  value: 1,
                                  activeColor: Colors.black,
                                  groupValue: controller.selectedTravelType.value,
                                  onChanged: (value) => controller.changeSelectedType(value!),
                                  title: const TextWidget(AppStrings.going , size: 12, weight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: RadioListTile(
                                  value: 2,
                                  activeColor: Colors.black,
                                  groupValue: controller.selectedTravelType.value,
                                  onChanged: (value) => controller.changeSelectedType(value!),
                                  title: const TextWidget(AppStrings.returning , size: 12, weight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, size.height * 0.01, 0, 0),
                      child: Container(
                        width: size.width * 0.85,
                        height: size.height * 0.1,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(size.width * 0.03)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.4,
                              height: size.height * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextWidget(
                                    "وقت وصول الرحلة",
                                    textColor: Colors.black,
                                    size: 14,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.04,
                                    child: const CarsOrderTimePicker(
                                      time: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.4,
                              height: size.height * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextWidget(
                                    "تاريخ وصول الرحلة",
                                    textColor: Colors.black,
                                    size: 14,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                      height: size.height * 0.04,
                                      child: const CarsOrderTimePicker(
                                        time: false,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
