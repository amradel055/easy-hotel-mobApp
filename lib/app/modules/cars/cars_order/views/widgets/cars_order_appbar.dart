// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
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
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.menu,
                    //       color: Colors.white,
                    //       size: size.width * 0.06,
                    //     )),
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
                              // color: Colors.white,
                              child: const Center(
                                  child: TextWidget(
                                "نقل من و الي ",
                                size: 14,
                                weight: FontWeight.bold,
                              )),
                            ),
                          ),
                          const Center(
                              child: TextWidget(
                            AppStrings.carsServices,
                            textColor: Colors.white,
                            size: 14,
                            weight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                    Obx(() => Directionality(
                      textDirection: TextDirection.rtl,
                     child: DropdownButtonHideUnderline(

                        child: DropdownButton<CarsTrafficLinesResponse>(
                          items: controller.trafficLines
                              .map((e) => DropdownMenuItem<CarsTrafficLinesResponse>(
                            alignment: Alignment.center,
                            value: e,
                            // enabled: e.enabled!,
                            child: Container(
                              color:  Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextWidget(e.lineName??""),
                                  // e.enabled == false ? const TextWidget(AppStrings.reserved ,size: 11, textColor: AppColors.appHallsRedDark, weight: FontWeight.bold,):const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ))
                              .toList(),
                          onChanged: (val) =>  controller.changeSelectedTrafficLines(val!),
                          value: controller.selectedTrafficLine.value,
                          alignment: Alignment.center,
                          iconSize: 25,
                        ),
                      ),
                      // child:DropdownButton <CarsTrafficLinesResponse>(
                      //
                      //       // showSearchBox: true,
                      //       items: controller.trafficLines,
                      //       itemAsString: (e) => e.lineName.toString(),
                      //       dropdownDecoratorProps: const DropDownDecoratorProps(
                      //         textAlign: TextAlign.center,
                      //         textAlignVertical: TextAlignVertical.center,
                      //       ),
                      //       onChanged: (value) => controller.changeSelectedTrafficLines(value!),
                      //       selectedItem: controller.selectedTrafficLine.value,
                      //     ),
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
                                  title: const TextWidget(AppStrings.goingAndReturn , size: 8, weight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: RadioListTile(
                                  value: 1,
                                  activeColor: Colors.black,
                                  groupValue: controller.selectedTravelType.value,
                                  onChanged: (value) => controller.changeSelectedType(value!),
                                  title: const TextWidget(AppStrings.going , size: 8, weight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                                child: RadioListTile(
                                  value: 2,
                                  activeColor: Colors.black,
                                  groupValue: controller.selectedTravelType.value,
                                  onChanged: (value) => controller.changeSelectedType(value!),
                                  title: const TextWidget(AppStrings.returning , size: 8, weight: FontWeight.bold),
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
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(size.width * 0.03)),
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
                                   AppStrings.arrivalTime,
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
                                   AppStrings.arrivalDate,
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
