import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/repository/spa/spa_repository.dart';
import 'package:get/get.dart';

class SpaDetailsController extends GetxController {

  int? id = Get.arguments;
  RxInt  index = 1.obs;
  RxInt  serviceIndex = 2.obs;
  RxInt selectedType = 1.obs;
  SpaResponse? spa ;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;



   @override
  void onInit() {
     if(id != null){
       getSpaDetailById();
     }else{
       getSpaDetailByHotel();
     }
     super.onInit();
  }

  getSpaDetailById() async {
    isLoading(true);
    final request = SpaDetailRequest(
      id: id ,
    );
    SpaRepository().getSpaDetail(request,
        onSuccess: (data) {
          spa=data.data;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }


  getSpaDetailByHotel() async {
    isLoading(true);
    final request = SpaDetailRequest(
      branchId: UserManager().selectedBranch?.id ,
    );
    SpaRepository().getSpaDetailByHotel(request,
        onSuccess: (data) {
          spa=data.data;
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

   getSpaSave() async {
     if(servicesSelected.toList().isEmpty){
       showPopupText("يجب اختيار خدمة") ;
       return ;
     }
     isLoading(true);
     final request = SpaSaveRequest(
       spaId:spa!.id! ,
       spaItemDTOList: servicesSelected.toList(),
       salesDetailSpaItemDTOList: [],
       companyId: AppConstants.companyId,
       createdBy: AppConstants.createdBy,
       customerId: UserManager().user!.id,
       branchId: spa!.branchId,
     );
     SpaRepository().getSpaSave(request,
         onSuccess: (data) {
           showPopupText( "تم الحفظ بنجاح");
           servicesSelected([]);
         },
         onError: (e) => showPopupText( e.toString()),
         onComplete: () => isLoading(false)
     );
   }



}
