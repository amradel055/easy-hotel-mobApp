import 'package:easy_hotel/app/components/text_field_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/validator.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/maintenance_checkout_controller.dart';

class MaintenanceCheckoutView
    extends GetView<MaintenanceCheckoutController> {
  const MaintenanceCheckoutView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: const [
            TextWidget("Checkout",size: 20,),
            TextWidget(AppStrings.maintenance,size: 15,textColor: AppColors.appGreyDark,)
          ],
        ),
      ),
        body: Container(
            // color: AppColors.white,
            width: size.width,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                      width: size.width * 0.9,
                       decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.00)),
                         border:  Border.all(color: AppColors.black,width: 1),
                       ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: [

                              Row(

                                children: [
                                  const TextWidget(
                                   AppStrings.services,
                                    // textColor: Colors.black,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                  // for(int i =0;i<controller.res[4]!.length;i++)
                                  TextWidget(
                                    controller.res[4].toString(),
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),


                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.timer),
                                  const TextWidget(
                                    AppStrings.time,
                                    // textColor: Colors.black,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                  TextWidget(
                                    DateFormat("yyyy-MM-dd").format(
                                        controller.res[1] ?? DateTime.now())
                                   ,
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ), TextWidget(
                                    DateFormat('  hh:mm aaa').format(
                                        controller.res[2] ?? DateTime.now()
                                    )
                                   ,
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),


                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                  ),
                   ),
                   // Container(
                   //   width: size.width * 0.8,
                   //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.width * 0.03,), color: AppColors.white),
                   //   child: Padding(
                   //     padding: const EdgeInsets.all(10.0),
                   //     child: Center(
                   //       child: Column(
                   //         children: [
                   //
                   //           TextWidget(
                   //             " طريقه الدفع ",
                   //             textColor: Colors.black,
                   //             size: 16,
                   //             weight: FontWeight.w600,
                   //           ),
                   //           Container(width: size.width,
                   //               child:Column(children: [
                   //                 ListTile(
                   //                   title: const TextWidget('Debit',textColor: Colors.black,),
                   //                   leading: Radio<String>(
                   //                     fillColor: MaterialStateColor.resolveWith((states) => AppColors.appBlue),
                   //                     focusColor: MaterialStateColor.resolveWith((states) => AppColors.appBlue),
                   //                     value: "debit",
                   //                     groupValue: "payment",
                   //                     onChanged: ( value) {
                   //
                   //                     },
                   //                   ),
                   //                 ),
                   //                 ListTile(
                   //                   title: const TextWidget('CASH',textColor: Colors.black),
                   //                   leading: Radio<String>(
                   //                     fillColor: MaterialStateColor.resolveWith((states) => AppColors.appBlue),
                   //                     focusColor: MaterialStateColor.resolveWith((states) => AppColors.appBlue),
                   //                     value: "cash",
                   //                     groupValue: "payment",
                   //                     onChanged: ( value) {
                   //
                   //                     },
                   //                   ),
                   //                 ),
                   //               ],)
                   //
                   //
                   //
                   //           ),
                   //
                   //
                   //         ],
                   //       ),
                   //     ),
                   //   ),
                   // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,10),
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  const TextWidget(
                                    AppStrings.prices,
                                    // textColor: Colors.black,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                  TextWidget(
                                    controller.res[5].toString(),
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: const [
                                  TextWidget(
                                    AppStrings.additions,
                                    // textColor: Colors.black,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                  TextWidget(
                                   AppStrings.notFound,
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: const [
                                  TextWidget(
                                    AppStrings.totalPrice,
                                    // textColor: Colors.black,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                  TextWidget(
                                    AppStrings.free,
                                    textColor: Colors.grey,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),


                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          children: [

                            Row(
                              children: [
                                const TextWidget(
                                 AppStrings.notes,
                                  // textColor: Colors.black,
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),
                                TextWidget(
                                  controller.res[3],
                                  textColor: Colors.grey,
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),


                              ],
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width*.9,
                      child: const TextWidget(AppStrings.personalInfo,size: 15,weight: FontWeight.bold,)),

                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00))),
                    margin: const EdgeInsets.fromLTRB(25,5,25,25),
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.registerForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          TextFieldWidget(
                            controller:controller.userNameController,
                            label: AppStrings.userName,
                            suffixIcon: Icons.pin,
                            textInputAction: TextInputAction.next,
                            validator: AppValidator.forceValue,

                          ),
                          space,
                          TextFieldWidget(
                            controller:controller.nameController,
                            label: AppStrings.name,
                            suffixIcon: Icons.pin,
                            textInputAction: TextInputAction.next,
                            validator: AppValidator.forceValue,
                          ),
                          space,
                          TextFieldWidget(
                            controller:controller.emailController,
                            label: AppStrings.email,
                            suffixIcon: Icons.email,
                            textInputAction: TextInputAction.next,
                            // validator: AppValidator.forceValue,
                          ),
                          space,
                          TextFieldWidget(
                            controller:controller.phoneController,
                            label: AppStrings.phone,
                            suffixIcon: Icons.phone,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                            validator: AppValidator.forceValue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.getMaintenanceSave();
                        },
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.4,
                          decoration: const BoxDecoration(
                            color: AppColors.appHallsRedDark,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Center(
                            child:  TextWidget(
                              AppStrings.reserve,
                              textAlign: TextAlign.center,
                              weight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
       );
  }
}
