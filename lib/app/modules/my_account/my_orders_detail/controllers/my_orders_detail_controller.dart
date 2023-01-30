



import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/orders_detail_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/review_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/response/orders_response_dto.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyOrdersDetailController extends GetxController {
  final selectedPersonsNumber = 1.obs;
  var comment = TextEditingController();
  final List res =Get.arguments;

  OrdersResponse? orderDetail ;
  final isLoading = false.obs;
  final reviewLoading = false.obs;




  @override
  void onInit() {
    super.onInit();
    getOrdersDetail();


  }

  getOrdersDetail() async {
    isLoading(true);
    final request = OrdersDetailRequestDto(
      id:res[0] ,
      appId: res[1]

    );
    SettingRepository().getOrdersDetail(request,
        onSuccess: (data) {
          orderDetail=data.data;


        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }


  changeSelectedPersonNumber(int selected) {
    selectedPersonsNumber(selected);}

  saveReview() {
    reviewLoading(true);
    final request = ReviewRequestDto(detailId:orderDetail!.id,invOrganizationId: UserManager().user!.id!,branchId:orderDetail!.branchId??232,createdBy: AppConstants.createdBy,companyId: AppConstants.companyId,
    reviewId: orderDetail!.reviewId,itemId: orderDetail!.itemId,reviewText: comment.text,rate:selectedPersonsNumber.value,appId: orderDetail!.appId );
    SettingRepository().saveReview(request,
        onComplete: () => reviewLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
         Get.back();
         getOrdersDetail();
         // Get.toNamed(Routes.MY_ORDERS_DETAIL);

          // print(UserManager().user!.currencyName!.toString());
          // city.assignAll(data.data);
          // if (data.data.isNotEmpty) {
          //   selectedCity(data.data[0]);
          //
          // }
        });
  }
}