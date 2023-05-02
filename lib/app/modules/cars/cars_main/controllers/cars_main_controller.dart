

import 'package:easy_hotel/app/data/model/cars/dto/response/cars_groups_response_dto.dart';
import 'package:easy_hotel/app/data/repository/cars/cars_repository.dart';
import 'package:get/get.dart';

import '../../../../core/utils/show_popup_text.dart';
import '../../../../core/utils/user_manager.dart';
import '../../../../data/model/cars/dto/request/cars_groups_request_dto.dart';

class CarsMainController extends GetxController {
  final categories = <CarsGroupsResponse> [].obs ;
  Rx<int>? selectedCat ;
  final loading = false.obs ;
  final List res =Get.arguments;


  @override
  void onInit() {
    loading(true);
    final carsGroupRequest = CarsGroupRequest(
      appId: res[1] ,
      branchId: UserManager().selectedBranch!.id!
    );
     CarsRepository().getCarsGroup(carsGroupRequest,
       onSuccess: (data){
         categories.assignAll(data.data ?? []);
       },
       onError: (e) => showPopupText(e.toString()),
       onComplete:() => loading(false)
     );
    super.onInit();
  }
}