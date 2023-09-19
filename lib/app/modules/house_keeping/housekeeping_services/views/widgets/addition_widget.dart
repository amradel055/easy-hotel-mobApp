import 'package:easy_hotel/app/components/additions_house_dialog.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/modules/house_keeping/housekeeping_services/controllers/house_keeping_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/icon_button_widget.dart';
import '../../../../../components/text_widget.dart';
import '../../../../../core/values/app_strings.dart';

class AdditionWidget extends GetView<HouseKeepingServicesController> {
  const AdditionWidget(this.index, {Key? key}) : super(key: key);
  final int ?index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Obx(() {
      return controller.housekeepingDetail.value != null && controller.housekeepingDetail[index!].additionsGroupDTOList!.isNotEmpty ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,4,0,0),
            child: Center(
              child: Row(
                children: [
                  // const TextWidget(
                  //   AppStrings.additions,
                  //   weight: FontWeight.bold,
                  //   children: [TextWidget(":")],
                  // ),
                  // const Spacer(),
                  IconButtonWidget(
                    icon: Icons.add,
                    onPressed: () => Get.dialog(const AdditionsDialog()),
                    padding: EdgeInsets.zero,
                    color: AppColors.restaurantThirdColor,
                  )
                ],
              ),
            ),
          ),
          // const Divider(height: 5),
          // SizedBox(
          //   height: size.height * 0.06 * controller.selectedAdd.length,
          //   child: ListView.builder(
          //     itemBuilder: (context , i){
          //      final  add = controller.selectedAdd[i];
          //       return SizedBox(
          //         width: size.width * 0.9,
          //
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Center(child: TextWidget(add.name! , weight: FontWeight.bold,)),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Center(child: TextWidget((add.price ?? AppStrings.free).toString(), weight: FontWeight.bold,children: const [TextWidget(AppStrings.LE)],)),
          //             ),
          //               IconButton(
          //                   onPressed: ()=> controller.changeAddedAdditions(add),
          //                   icon:const Icon(Icons.remove , color: Colors.red,)),
          //           ],
          //         ),
          //       );
          //     },
          //     itemCount: controller.selectedAdd.length,
          //   ),
          // )
        ],
      ):const SizedBox.shrink();
    });
  }
}
