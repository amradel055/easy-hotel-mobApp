import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_cities_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_currency_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_cities_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_currency_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_languages_response.dart';
import 'package:easy_hotel/app/data/repository/auth/auth_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController(text: Get.arguments ?? "");
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  final isLoading = false.obs;
  final currencyLoading = false.obs;
  final languageLoading = false.obs;
  final cityLoading = false.obs;
  final requestDto = RegisterRequestDto();
  final registerForm = GlobalKey<FormState>();
  XFile? image;
  final city = <CityResponse>[].obs;
  final selectedCity = Rxn<CityResponse>();
  final language = <LanguageResponse>[].obs;
  final selectedLanguage = Rxn<LanguageResponse>();
  final currency = <CurrencyResponse>[].obs;
  final selectedCurrency = Rxn<CurrencyResponse>();

  @override
  void onInit() {
    super.onInit();
    getAllCities();
    getAllLanguages();
    getAllCurrency();



  }

  Future register() async {
    if(!registerForm.currentState!.validate()) return;
    isLoading(true);
    AuthRepository().register(requestDto,
        onSuccess: (data){
          UserManager().login(data.data);
          Get.offNamed(Routes.HOME);
        },
        onError: (error)=> showPopupText(error.toString()),
        onComplete: () => isLoading(false)
    );
  }

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
      image = img;
  }
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
            requestDto.cityId = data.data[0].id;

          }
        });
  }
  changeSelectedCity(CityResponse selected) {
    selectedCity(selected);
    requestDto.cityId = selected.id;

  }
  getAllLanguages() {
    languageLoading(true);
    final request = AllCitiesRequestDto();
    AuthRepository().getAllLanguages(request,
        onComplete: () => languageLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          language.assignAll(data.data);
          if (data.data.isNotEmpty) {
            selectedLanguage(data.data[0]);
            requestDto.languageId = data.data[0].id;

          }
        });
  }
  changeSelectedLanguage(LanguageResponse selected) {
    selectedLanguage(selected);
    requestDto.languageId = selected.id;

  }
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
            requestDto.currencyId = data.data[0].id;

          }
        });
  }
  changeSelectedCurrency(CurrencyResponse selected) {
    selectedCurrency(selected);
    requestDto.currencyId = selected.id;
  }
}
