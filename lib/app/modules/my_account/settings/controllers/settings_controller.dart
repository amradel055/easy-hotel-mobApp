



import 'dart:ui';

import 'package:easy_hotel/app/core/themes/app_theme.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/auth/login/dto/response/login_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_cities_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_currency_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_currency_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_languages_response.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/city_edit_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/currency_edit_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/language_edit_request.dart';
import 'package:easy_hotel/app/data/repository/auth/auth_repository.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../data/model/auth/register/dto/response/all_cities_response.dart';

class SettingsController extends GetxController {
  final city = <CityResponse>[].obs;
  final selectedCity = Rxn<CityResponse>();
  final language = <LanguageResponse>[].obs;
  final selectedLanguage = Rxn<LanguageResponse>();
  final currency = <CurrencyResponse>[].obs;
  final selectedCurrency = Rxn<CurrencyResponse>();
  final currencyLoading = false.obs;
  final languageLoading = false.obs;
  final cityLoading = false.obs;
  final editCurrencyLoading = false.obs;
  final isDark = (AppTheme.isDark).obs;

  @override
  void onInit() {
    super.onInit();

    getAllCurrency();
    getAllCities();
    // getAllLanguages();



  }
  final List locale =[
    {'name':AppStrings.englishName,'locale': Locale(AppStrings.englishLang,AppStrings.englishCountry)},
    {'name':AppStrings.arabicName,'locale': Locale('ar','eg')},
  ];
  final RxString languages =UserManager().user!.languageName!.obs;
  getAllCurrency() {
    currencyLoading(true);
    final request = AllCurrencyRequestDto(companyId:AppConstants.companyId);
    AuthRepository().getAllCurrency(request,
        onComplete: () => currencyLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          currency.assignAll(data.data);
          if (data.data.isNotEmpty) {
            selectedCurrency(data.data[0]);

          }
        });
  }
  changeSelectedCurrency(CurrencyResponse selected) {
    selectedCurrency(selected);
  }
  // getAllLanguages() {
  //   languageLoading(true);
  //   final request = AllCitiesRequestDto();
  //   AuthRepository().getAllLanguages(request,
  //       onComplete: () => languageLoading(false),
  //       onError: (e) => showPopupText(e),
  //       onSuccess: (data) {
  //         language.assignAll(data.data);
  //         if (data.data.isNotEmpty) {
  //           selectedLanguage(data.data[0]);
  //
  //         }
  //       });
  // }
  // changeSelectedLanguage(LanguageResponse selected) {
  //   selectedLanguage(selected);
  //
  // }
  getAllCities() {
    cityLoading(true);
    final request = AllCitiesRequestDto(branchId:232);
    AuthRepository().getAllCities(request,
        onComplete: () => cityLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          city.assignAll(data.data);
          if (data.data.isNotEmpty) {
            selectedCity(data.data[0]);

          }
        });
  }
  changeSelectedCity(CityResponse selected) {
    selectedCity(selected);

  }

  editCurrency() {
    editCurrencyLoading(true);
    final request = EditCurrencyRequestDto(id: UserManager().user!.id!,currencyId: selectedCurrency.value!.id!);
    SettingRepository().editCurrency(request,
        onComplete: () => editCurrencyLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {

          final user = UserManager().user!.toJson();
          user["currencyName"] = selectedCurrency.value!.name;
        user["currencyId"] = selectedCurrency.value!.id;
      UserManager().login(LoginResponse.fromJson(user));
      print(
          UserManager().user!.currencyName!.toString());
          // city.assignAll(data.data);
          // if (data.data.isNotEmpty) {
          //   selectedCity(data.data[0]);
          //
          // }
        });
  }
  editCity() {
    editCurrencyLoading(true);
    final request = EditCityRequestDto(id: UserManager().user!.id!,cityId: selectedCity.value!.id!);
    SettingRepository().editCity(request,
        onComplete: () => editCurrencyLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          final user = UserManager().user!.toJson();
          user["cityName"] = selectedCity.value!.name;
          user["cityId"] = selectedCity.value!.id;
          UserManager().login(LoginResponse.fromJson(user));
          // city.assignAll(data.data);
          // if (data.data.isNotEmpty) {
          //   selectedCity(data.data[0]);
          //
          // }
        });
  }
  editLanguage() {
    editCurrencyLoading(true);
    final request = EditLanguageRequestDto(id: UserManager().user!.id!,languageId: 1);
    SettingRepository().editLanguage(request,
        onComplete: () => editCurrencyLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          // city.assignAll(data.data);
          // if (data.data.isNotEmpty) {
          //   selectedCity(data.data[0]);
          //
          // }
        });
  }
}