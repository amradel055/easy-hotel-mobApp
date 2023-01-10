import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/Reviews_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_detail_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:get/get.dart';

class HouseKeepingServicesController extends GetxController {
  var housekeepingDetail = <HouseKeepingDetailResponse>[].obs;
   ReviewsResponse ?reviewsResponse;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final servicesSelectedNames = <String>[].obs;
  final servicesSelectedPrices = <String>[].obs;
  final List args = Get.arguments;
  // final int branchId = Get.arguments;
  // final int index = Get.arguments;



  @override
  void onInit() {
    super.onInit();
    getHousekeepingGroup();
    getHousekeepingGroupReviews();


  }

  getHousekeepingGroup() async {
    isLoading(true);
    final request = HousekeepingDetailRequest(
      groupId: args[0],

    );
    HousekeepingRepository().getHousekeepingDetail(request,
        onSuccess: (data) {
          housekeepingDetail.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  getHousekeepingGroupReviews() async {
    isLoading(true);
    final request = HousekeepingDetailRequest(
      groupId: args[0],

    );
    HousekeepingRepository().getHousekeepingReview(request,
        onSuccess: (data) {
          reviewsResponse=data.data;

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }




}
