import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/Reviews_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_detail_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_groups_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:get/get.dart';

class HouseKeepingServicesController extends GetxController {
  final housekeepingDetail = <HouseKeepingDetailResponse>[].obs;
   ReviewsResponse ?reviewsResponse;
  final isLoading = false.obs;
  final servicesLoading = false.obs;
  final reviewsLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final servicesSelectedNames = <String>[].obs;
  final servicesSelectedPrices = <String>[].obs;
  final servicesSelectedAdded = <HouseKeepingDetailResponse>[].obs;
  final List args = Get.arguments;
  // final int branchId = Get.arguments;
  // final int index = Get.arguments;
  final selectedAdd = <AdditionsGroupModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    servicesSelectedAdded.clear();housekeepingDetail.clear();
    getHousekeepingGroup();
    getHousekeepingGroupReviews();


  }
  changeAddedAdditions (AddtionsModel add,int index){
    if(housekeepingDetail[index].addtionsDTOList!.contains(add)){
      housekeepingDetail[index].addtionsDTOList!.remove(add);
    }else{
      housekeepingDetail[index].addtionsDTOList!.add(add);
      print( housekeepingDetail[index].addtionsDTOList!);
    }
  }

  getHousekeepingGroup() async {
    servicesLoading(true);
    final request = HousekeepingDetailRequest(
      groupId: args[0],

    );
    HousekeepingRepository().getHousekeepingDetail(request,
        onSuccess: (data) {
          housekeepingDetail.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => servicesLoading(false)
    );
  }
  getHousekeepingGroupReviews() async {
    reviewsLoading(true);
    final request = HousekeepingDetailRequest(
      groupId: args[0],

    );
    HousekeepingRepository().getHousekeepingReview(request,
        onSuccess: (data) {
          reviewsResponse=data.data;

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => reviewsLoading(false)
    );
  }




}
