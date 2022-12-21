
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_city_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/all_spa_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_hotel_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_search_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_city_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_search_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

class SpaRepository {

  getSpaGroup(
      AllSpaRequest spaGroupRequest, {
        Function()? onComplete,
        SuccessFunc<List<SpaResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<SpaResponse>>('spa/allSpa',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: spaGroupRequest.toJson(),
        onError: onError,
        convertor: SpaResponse.fromList,
      );

  getSpaOffer(
      AllSpaRequest spaGroupRequest, {
        Function()? onComplete,
        SuccessFunc<List<SpaResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<SpaResponse>>('spa/offersListByAppId',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: spaGroupRequest.toJson(),
        onError: onError,
        convertor: SpaResponse.fromList,
      );


  getSpaSearch(
      SpaSearchRequest spaSearchRequest, {
        SuccessFunc<SpaSearchResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<SpaSearchResponse>(
        'spa/searchListApiSpa',
        onSuccess: onSuccess,
        data: spaSearchRequest.toJson(),
        onError: onError,
        convertor: SpaSearchResponse.fromJson,
        onComplete: onComplete
    );
  }

  getSpaCity(
      SpaCityRequest spaCityRequest, {
        Function()? onComplete,
        SuccessFunc<List<SpaCityResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<SpaCityResponse>>('spa/spaListByCityId',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: spaCityRequest.toJson(),
        onError: onError,
        convertor: SpaCityResponse.fromList,
      );
  getSpaHotel(
      SpaHotelRequest spaHotelRequest, {
        Function()? onComplete,
        SuccessFunc<List<SpaCityResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<SpaCityResponse>>('spa/spaListByHotelId',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: spaHotelRequest.toJson(),
        onError: onError,
        convertor: SpaCityResponse.fromList,
      );

  getSpaDetail(
      SpaDetailRequest spaDetailRequest, {
        SuccessFunc<SpaResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<SpaResponse>(
        'spa/spaDetail',
        onSuccess: onSuccess,
        data: spaDetailRequest.toJson(),
        onError: onError,
        convertor: SpaResponse.fromJson,
        onComplete: onComplete
    );
  }
  getSpaDetailByHotel(
      SpaDetailRequest spaDetailRequest, {
        SuccessFunc<SpaResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<SpaResponse>(
        'spa/spaByHotel',
        onSuccess: onSuccess,
        data: spaDetailRequest.toJson(),
        onError: onError,
        convertor: SpaResponse.fromJson,
        onComplete: onComplete
    );
  }

  getSpaSave(
      SpaSaveRequest spaSaveRequest, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'spa/save',
        onSuccess: onSuccess,
        data: spaSaveRequest.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }

}
