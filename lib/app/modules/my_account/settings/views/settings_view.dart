import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_hotel/app/components/icon_button_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/themes/app_theme.dart';
import 'package:easy_hotel/app/core/utils/common.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_currency_response.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/settings/controllers/settings_controller.dart';
import 'package:easy_hotel/app/modules/my_account/settings/views/widgets/setting_tab_widget.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/auth/register/dto/response/all_cities_response.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title:
        const TextWidget(
          AppStrings.setting, weight: FontWeight.bold, size: 20,),
        actions: [

          UnconstrainedBox(
            child: IconButtonWidget(
              icon:  Icons.notifications,
              onPressed: () {
                // FavProductsManager().addProduct(controller.room!, context);
              },
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.editCurrencyLoading.value ||
            controller.currencyLoading.value) {
          return Center(
            child: Common.getSpin(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SettingTabWidget(Icons.language, AppStrings.language,),
                    TextWidget(
                      controller.languages.value, weight: FontWeight.bold,
                      size: 15,),


                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(onPressed: () {
                        buildLanguageDialog(context);
                      }, child: const TextWidget(AppStrings.language,weight: FontWeight.bold,
                        size: 15,)),
                    ),
                  ],
                ),
                Container(
                  height: 2, width: size.width, color: AppColors.appGreyDark,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SettingTabWidget(Icons.attach_money, AppStrings.currency),
                    TextWidget(UserManager().user!.currencyName??"", size: 15,
                      weight: FontWeight.bold,),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: DropdownSearch<CurrencyResponse>(
                        // showSearchBox: true,
                        items: controller.currency,
                        itemAsString: (e) => e.name!,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,

                        ),
                        onChanged: (value) {
                          controller.changeSelectedCurrency(value!);
                          controller.editCurrency();
                        }
                        ,
                        selectedItem: controller.selectedCurrency.value,
                      ),
                    )


                  ],
                ),
                Container(
                  height: 2, width: size.width, color: AppColors.appGreyDark,),
                Obx(() {
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SettingTabWidget(Icons.light_mode, AppStrings.mode),
                      TextWidget(!controller.isDark.value
                          ? "Light"
                          : "Dark", size: 15, weight: FontWeight.bold,)
                      ,
                      Obx(() {
                        return SizedBox(
                          width: 105,
                          height: 40,
                          child: Switch.adaptive(
                              value: controller.isDark.value,
                              onChanged: (value) {
                                controller.isDark(!controller.isDark.value);
                                AppTheme().changeThemeMode(value);
                                // AppTheme.isDark.value = !AppTheme.isDark.value;
                              }),
                        );
                      })


                    ],
                  );
                }),
                Container(
                  height: 2, width: size.width, color: AppColors.appGreyDark,),
                Obx(() {
                  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SettingTabWidget(Icons.home, AppStrings.city),
                      TextWidget(UserManager().user!.cityName ?? "", size: 15,
                        weight: FontWeight.bold,),
                      SizedBox(
                        width: 110,
                        height: 40,
                        child: DropdownSearch<CityResponse>(
                          // showSearchBox: true,
                          items: controller.city,
                          itemAsString: (e) => e.name!,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                          ),
                          onChanged: (value) {
                            controller.changeSelectedCity(value!);
                            controller.editCity();
                          }
                          ,
                          selectedItem: controller.selectedCity.value,
                        ),
                      )


                    ],
                  );
                }),
                Container(
                  height: 2, width: size.width, color: AppColors.appGreyDark,),
                // Container(height: 2,width: size.width,color: AppColors.appGreyDark,),


              ],
            ),
          ),
        );
      })
      ,
    );
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(context: context,
        builder: (builder) {
          return AlertDialog(
            title: const TextWidget('Choose Your Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(controller.locale[index]['name']),
                        onTap: () {
                          // print(controller.locale[index]['name']);
                          controller.languages.value =
                          controller.locale[index]['name'];
                          updateLanguage(controller.locale[index]['locale']);
                          controller.editLanguage();
                        },),
                    );
                  }, separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              }, itemCount: controller.locale.length
              ),
            ),
          );
        }
    );
  }
}
