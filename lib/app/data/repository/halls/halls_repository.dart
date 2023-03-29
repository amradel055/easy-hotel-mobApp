
import 'package:easy_hotel/app/data/model/halls/dto/request/all_additions_halls__request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/all_halls_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_save_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_search_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/offers_halls_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_search_filter_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_search_response_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/all_housekeeping_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_save_request.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_detail_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_groups_response.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

import '../../model/halls/dto/request/halls_period_request.dart';
import '../../model/halls/dto/response/halls_periods_response.dart';

class HallsRepository {

  getAllHalls(
      AllHallsRequest allHallsRequest, {
        Function()? onComplete,
        SuccessFunc<List<HallsResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HallsResponse>>('halls/HallsList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allHallsRequest.toJson(),
        onError: onError,
        convertor: HallsResponse.fromList,
      );

  getOffersHalls(
      OffersHallsRequest offersHallsRequest, {
        Function()? onComplete,
        SuccessFunc<List<HallsResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HallsResponse>>('halls/offersList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: offersHallsRequest.toJson(),
        onError: onError,
        convertor: HallsResponse.fromList,
      );
  getSearchHalls(
      HallsSearchRequest hallsSearchRequest, {
        SuccessFunc<HallsSearchResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<HallsSearchResponse>(
        'halls/searchListApiHoles',
        onSuccess: onSuccess,
        data: hallsSearchRequest.toJson(),
        onError: onError,
        convertor: HallsSearchResponse.fromJson,
        onComplete: onComplete
    );
  }
  getSearchFilterHalls(
      HallSearchFilterRequest hallSearchFilterRequest, {
        Function()? onComplete,
        SuccessFunc<List<HallsSearchFilterResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HallsSearchFilterResponse>>('halls/findHallsByFiltterData',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: hallSearchFilterRequest.toJson(),
        onError: onError,
        convertor: HallsSearchFilterResponse.fromList,
      );
     getAllAdditionsHalls(
         AllAdditionsHallsRequest allAdditionsHallsRequest, {
        Function()? onComplete,
        SuccessFunc<List<AdditionsGroupModel>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<AdditionsGroupModel>>('halls/findAllGroupAdditions',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allAdditionsHallsRequest.toJson(),
        onError: onError,
        convertor: AdditionsGroupModel.fromList,
      );

  getHallDetail(
      HallDetailRequest hallDetailRequest, {
        SuccessFunc<HallsDetailResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<HallsDetailResponse>(
        'halls/hallDetail',
        onSuccess: onSuccess,
        data: hallDetailRequest.toJson(),
        onError: onError,
        convertor: HallsDetailResponse.fromJson,
        onComplete: onComplete
    );
  }
  Future getHallPeriods(
      HallsPeriodsRequest hallsPeriodsRequest, {
        SuccessFunc<List<HallsPeriodsResponse>> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) async{
    await ApiProvider().post<List<HallsPeriodsResponse>>(
        'halls/findHolePeriods',
        onSuccess: onSuccess,
        data: hallsPeriodsRequest.toJson(),
        onError: onError,
        convertor: HallsPeriodsResponse.fromList,
        onComplete: onComplete
    );
  }

  getHallReservedPeriods(
      HallsPeriodsRequest hallsPeriodsRequest, {
        SuccessFunc<List<HallsPeriodsResponse>> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<List<HallsPeriodsResponse>>(
        'halls/findPeriodsReservedForHall',
        onSuccess: onSuccess,
        data: hallsPeriodsRequest.toJson(),
        onError: onError,
        convertor: HallsPeriodsResponse.fromList,
        onComplete: onComplete
    );
  }
  getHallSave(
      HallsSaveRequest hallsSaveRequest, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'halls/save',
        onSuccess: onSuccess,
        data: hallsSaveRequest.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }

}
