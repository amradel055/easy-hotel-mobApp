
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/all_housekeeping_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_save_request.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/Reviews_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_detail_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_groups_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

class HousekeepingRepository {

  getHousekeepingGroup(
      AllHousekeepingRequest allHousekeepingRequest, {
        Function()? onComplete,
        SuccessFunc<List<HousekeepingGroupResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HousekeepingGroupResponse>>('houseKeeping/groupList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allHousekeepingRequest.toJson(),
        onError: onError,
        convertor: HousekeepingGroupResponse.fromList,
      );
  getHousekeepingDetail(
      HousekeepingDetailRequest housekeepingDetailRequest, {
        Function()? onComplete,
        SuccessFunc<List<HouseKeepingDetailResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<HouseKeepingDetailResponse>>('houseKeeping/houseKeepingItemsList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: housekeepingDetailRequest.toJson(),
        onError: onError,
        convertor: HouseKeepingDetailResponse.fromList,
      );
  getHousekeepingReview(
      HousekeepingDetailRequest housekeepingDetailRequest, {
        SuccessFunc<ReviewsResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<ReviewsResponse>(
        'houseKeeping/getAverageAndReviewByItemId',
        onSuccess: onSuccess,
        data: housekeepingDetailRequest.toJson(),
        onError: onError,
        convertor: ReviewsResponse.fromJson,
        onComplete: onComplete
    );
  }


  getHousekeepingSave(
      HousekeepingSaveRequest housekeepingSaveRequest, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'houseKeeping/save',
        onSuccess: onSuccess,
        data: housekeepingSaveRequest.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }


}
