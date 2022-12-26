import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/all_halls_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/offers_halls_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:get/get.dart';

class HallsController extends GetxController {

  final allHalls = <HallsResponse>[].obs;
  final offersHalls = <HallsResponse>[].obs;
  final isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    getAllHalls();
    getOffersHalls();


  }

  getAllHalls() async {
    isLoading(true);
    final request = AllHallsRequest(
      branchId: UserManager().selectedBranch!.id!,
    );
    HallsRepository().getAllHalls(request,
        onSuccess: (data) {
          allHalls.assignAll(data.data);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false)
    );
  }
  getOffersHalls() async {
    isLoading(true);
    final request = OffersHallsRequest(
      appId: 6,
      currencySerial:1

    );
    HallsRepository().getOffersHalls(request,
        onSuccess: (data) {
          offersHalls.assignAll(data.data);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }
}
