
import 'package:easy_hotel/app/data/provider/api_provider.dart';

import '../../model/maintenance/dto/request/all_maintenance_request_dto.dart';
import '../../model/maintenance/dto/request/maintenance_detail_request_dto.dart';
import '../../model/maintenance/dto/request/maintenance_save_request.dart';
import '../../model/maintenance/dto/response/Reviews_response.dart';
import '../../model/maintenance/dto/response/maintenance_detail_response.dart';
import '../../model/maintenance/dto/response/maintenance_groups_response.dart';

class MaintenanceRepository {

  getMaintenanceGroup(
      AllMaintenanceRequest allMaintenanceRequest, {
        Function()? onComplete,
        SuccessFunc<List<MaintenanceGroupResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<MaintenanceGroupResponse>>('maintenance/groupList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: allMaintenanceRequest.toJson(),
        onError: onError,
        convertor: MaintenanceGroupResponse.fromList,
      );
  getMaintenanceDetail(
      MaintenanceDetailRequest MaintenanceDetailRequest, {
        Function()? onComplete,
        SuccessFunc<List<MaintenanceDetailResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<MaintenanceDetailResponse>>('maintenance/maintenanceItemsList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: MaintenanceDetailRequest.toJson(),
        onError: onError,
        convertor: MaintenanceDetailResponse.fromList,
      );
  getMaintenanceReview(
      MaintenanceDetailRequest MaintenanceDetailRequest, {
        SuccessFunc<ReviewsResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<ReviewsResponse>(
        'maintenance/getAverageAndReviewByItemId',
        onSuccess: onSuccess,
        data: MaintenanceDetailRequest.toJson(),
        onError: onError,
        convertor: ReviewsResponse.fromJson,
        onComplete: onComplete
    );
  }


  getMaintenanceSave(
      MaintenanceSaveRequest maintenanceSaveRequest, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'maintenance/save',
        onSuccess: onSuccess,
        data: maintenanceSaveRequest.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }


}
