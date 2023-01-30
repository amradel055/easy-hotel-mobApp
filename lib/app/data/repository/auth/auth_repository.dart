import 'package:easy_hotel/app/data/model/auth/forget_password/dto/request/forget_password_request_dto.dart';
import 'package:easy_hotel/app/data/model/auth/login/dto/request/login_request.dart';
import 'package:easy_hotel/app/data/model/auth/login/dto/response/login_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_cities_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/all_currency_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/request/register_request.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_currency_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/all_languages_response.dart';
import 'package:easy_hotel/app/data/model/auth/register/dto/response/register_response.dart';
import 'package:easy_hotel/app/data/model/base_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/cities_request_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

import '../../model/auth/register/dto/response/all_cities_response.dart';

class AuthRepository {

  register(
    RegisterRequestDto request, {
    SuccessFunc<LoginResponse> onSuccess, Function()?onComplete,
    Function(dynamic error)? onError,
    // Function()? onComplete,
  }) {
    ApiProvider().post<LoginResponse>(
      'auth/registerNew',
      data: request.toJson(),
      onSuccess: onSuccess,
      onComplete: onComplete,
      onError: onError,
      convertor: LoginResponse.fromJson,
        // onComplete: onComplete

    );
  }

  resetPassword(
      ForgetPasswordRequest request, {
        SuccessFunc<void> onSuccess, Function()?onComplete,
        Function(dynamic error)? onError,
        // Function()? onComplete,
      }) {
    ApiProvider().post<void>(
      'auth/registerNew',
      data: request.toJson(),
      onSuccess: onSuccess,
      onComplete: onComplete,
      onError: onError,
      convertor: (_){return null;},
      // onComplete: onComplete

    );
  }
  getAllCities(
      AllCitiesRequestDto allCitiesRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<CityResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CityResponse>>('cities/citiesList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allCitiesRequestDto.toJson(),
        onError: onError,
        convertor: CityResponse.fromList,
      );
  getAllLanguages(
      AllCitiesRequestDto allCitiesRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<LanguageResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<LanguageResponse>>('languages/langagesList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allCitiesRequestDto.toJson(),
        onError: onError,
        convertor: LanguageResponse.fromList,
      );
  getAllCurrency(
      AllCurrencyRequestDto allCurrencyRequestDto, {
        Function()? onComplete,
        SuccessFunc<List<CurrencyResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CurrencyResponse>>('currency/currencyList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allCurrencyRequestDto.toJson(),
        onError: onError,
        convertor: CurrencyResponse.fromList,
      );
  login(
    LoginRequestDto request, {
    SuccessFunc<LoginResponse> onSuccess,
    Function(dynamic error)? onError,
        Function()? onComplete,
    // Function(dynamic error)? onError,  Function()?onComplete,
  }) {
    ApiProvider().post<LoginResponse>(
      'auth/loginNew',
      onSuccess: onSuccess,
      data: request.toJson(),
      onComplete: onComplete,
      queryParameters: request.toJson(),
      onError: onError,
      convertor: LoginResponse.fromJson,
      // onComplete: onComplete
    );
  }
}
