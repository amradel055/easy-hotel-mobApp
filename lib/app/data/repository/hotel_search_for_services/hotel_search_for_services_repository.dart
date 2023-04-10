


import 'package:easy_hotel/app/data/model/app_services/dto/request/application_request.dart';
import 'package:easy_hotel/app/data/model/app_services/dto/response/application_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_search_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_search_request_dto.dart';
import 'package:easy_hotel/app/data/model/user/dto/request/get_hotel_for_service_request.dart';

import '../../provider/api_provider.dart';

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
}