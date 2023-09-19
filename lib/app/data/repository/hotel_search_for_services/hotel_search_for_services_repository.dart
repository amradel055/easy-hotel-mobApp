


import 'package:easy_hotel/app/data/model/app_services/dto/request/application_request.dart';
import 'package:easy_hotel/app/data/model/app_services/dto/response/application_response_dto.dart';
import 'package:easy_hotel/app/data/model/hotel_detail/request/hotel_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/hotel_detail/response/hotel_detail_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_search_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_search_request_dto.dart';
import 'package:easy_hotel/app/data/model/user/dto/request/get_hotel_for_service_request.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

import '../../model/user/dto/request/hotel_places_request.dart';
import '../../model/user/dto/response/delivery_place_response.dart';

class HotelSearchForServicesRepository {

  Future searchHotelForServices(
      SpaSearchRequest spaGroupRequest, {
        Function()? onComplete,
        SuccessFunc<List<HotelsearchModel>> onSuccess,
        Function(dynamic error)? onError,
      }) async =>
    await  ApiProvider().post<List<HotelsearchModel>>('branch/hotelListByString',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: spaGroupRequest.toJson(),
        onError: onError,
        convertor: HotelsearchModel.fromList,
      );

  getHotelForServicesByCustomerId(
      GetHotelForServicesRequest request, {
        Function()? onComplete,
        SuccessFunc<HotelsearchModel?>? onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<HotelsearchModel>('rooms/getHotel',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor:(json) => HotelsearchModel.fromJson(json),
      );

     getHotelListForServicesByCustomerId(
      GetHotelForServicesRequest request, {
        Function()? onComplete,
        SuccessFunc<List<HotelsearchModel>?>? onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HotelsearchModel>?>('branch/getAllHotelByCustomerId',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor:HotelsearchModel.fromList,
      );
   Future appServices(
       ApplicationRequest applicationRequest, {
        Function()? onComplete,
        SuccessFunc<List<ApplicationResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) async =>
      await  ApiProvider().post<List<ApplicationResponse>>('branchApplications/applicationsIdList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: applicationRequest.toJson(),
        onError: onError,
        convertor: ApplicationResponse.fromList,
      );

     Future hotelPlaces(
       HotelPalcesRequest applicationRequest, {
        Function()? onComplete,
        SuccessFunc<List<DeliveryPlaceResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) async =>
      await  ApiProvider().post<List<DeliveryPlaceResponse>>('deliveryPlaces/deliveryPlacesList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: applicationRequest.toJson(),
        onError: onError,
        convertor: DeliveryPlaceResponse.fromList,
      );
  // getHotelDetailById(
  //     HotelDetailRequest request, {
  //       Function()? onComplete,
  //       SuccessFunc<HotelDetail?>? onSuccess,
  //       Function(dynamic error)? onError,
  //     }) =>
  //     ApiProvider().post<HotelDetail>('branch/findHotelIdById',
  //       onComplete: onComplete,
  //       onSuccess: onSuccess,
  //       data: request.toJson(),
  //       onError: onError,
  //       convertor: HotelDetail.fromJson,
  //     );
  getHotelDetailById(
      HotelDetailRequest request, {
        SuccessFunc<HotelDetail> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<HotelDetail>(
        'branch/findHotelIdById',
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor: HotelDetail.fromJson,
        onComplete: onComplete
    );
  }

}