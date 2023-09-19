import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/request/all_maintenance_request_dto.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/request/maintenance_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/response/Reviews_response.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/response/maintenance_detail_response.dart';
import 'package:easy_hotel/app/data/model/maintenance/dto/response/maintenance_groups_response.dart';
import 'package:get/get.dart';

import '../../../../data/repository/maintenence/maintenence_repository.dart';

class MaintenanceServicesController extends GetxController {
  var maintenanceDetail = <MaintenanceDetailResponse>[].obs;
   ReviewsResponse ?reviewsResponse;
  final isLoading = false.obs;
  final servicesLoading = false.obs;
  final reviewsLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final servicesSelectedNames = <String>[].obs;
  final servicesSelectedPrices = <String>[].obs;
  final servicesSelectedAdded = <MaintenanceDetailResponse>[].obs;
  final List args = Get.arguments;
  // final int branchId = Get.arguments;
  // final int index = Get.arguments;
  final RxInt serviceId = 0.obs;

  var maintenanceGroup = <MaintenanceGroupResponse>[].obs;
  // final isLoading = false.obs;


  @override
  void onInit() {
    getMaintenanceAllGroup();

    super.onInit();



  }
  getMaintenanceAllGroup() async {
    isLoading(true);
    final request = AllMaintenanceRequest(
      appId: args[1],

    );
    MaintenanceRepository().getMaintenanceGroup(request,
        onSuccess: (data) {
           maintenanceGroup.assignAll(data.data);
          // serviceId.value = data.data[0].id! ;
          getMaintenanceGroup(data.data.length>0?data.data[0].id:0);
          getMaintenanceGroupReviews(data.data.length>0?data.data[0].id:0);
          // MaintenanceSearchlist=maintenanceGroup;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }


  getMaintenanceGroup(int? id) async {
    servicesLoading(true);
    final request = MaintenanceDetailRequest(
      groupId: id!,

    );
    MaintenanceRepository().getMaintenanceDetail(request,
        onSuccess: (data) {
          maintenanceDetail.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => servicesLoading(false)
    );
  }
  getMaintenanceGroupReviews(int?id) async {
    reviewsLoading(true);
    final request = MaintenanceDetailRequest(
      groupId:id!,

    );
    MaintenanceRepository().getMaintenanceReview(request,
        onSuccess: (data) {
          reviewsResponse=data.data;

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => reviewsLoading(false)
    );
  }




}
