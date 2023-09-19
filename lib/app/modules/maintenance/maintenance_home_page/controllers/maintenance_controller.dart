import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:get/get.dart';

import '../../../../data/model/maintenance/dto/request/all_maintenance_request_dto.dart';
import '../../../../data/model/maintenance/dto/response/maintenance_groups_response.dart';
import '../../../../data/repository/maintenence/maintenence_repository.dart';

class MaintenanceController extends GetxController {

  var maintenanceGroup = <MaintenanceGroupResponse>[].obs;
  var MaintenanceSearchlist = <MaintenanceGroupResponse>[].obs;
  final isLoading = false.obs;
  final List res =Get.arguments;



  @override
  void onInit() {
    super.onInit();
    getMaintenanceGroup();


  }

  getMaintenanceGroup() async {
    isLoading(true);
    final request = AllMaintenanceRequest(
      appId: res[1],

    );
    MaintenanceRepository().getMaintenanceGroup(request,
        onSuccess: (data) {
          maintenanceGroup.assignAll(data.data);
          // MaintenanceSearchlist=maintenanceGroup;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  // filter(String name){
  //   maintenanceGroup.value = List<MaintenanceGroupResponse>.from(MaintenanceSearchlist.where((element) => element.name!.contains(name)).toList());
  // }

}
