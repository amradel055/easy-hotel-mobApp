import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/all_housekeeping_request_dto.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_groups_response.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:get/get.dart';

class HouseKeepingController extends GetxController {

  var housekeepingGroup = <HousekeepingGroupResponse>[].obs;
  var HousekeepingSearchlist = <HousekeepingGroupResponse>[].obs;
  final isLoading = false.obs;
  final List res =Get.arguments;



  @override
  void onInit() {
    super.onInit();
    getHousekeepingGroup();


  }

  getHousekeepingGroup() async {
    isLoading(true);
    final request = AllHousekeepingRequest(
      appId: res[1],

    );
    HousekeepingRepository().getHousekeepingGroup(request,
        onSuccess: (data) {
          housekeepingGroup.assignAll(data.data);
          // HousekeepingSearchlist=housekeepingGroup;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  // filter(String name){
  //   housekeepingGroup.value = List<HousekeepingGroupResponse>.from(HousekeepingSearchlist.where((element) => element.name!.contains(name)).toList());
  // }

}
