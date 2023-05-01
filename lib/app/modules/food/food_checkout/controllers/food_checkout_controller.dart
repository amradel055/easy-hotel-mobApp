import 'package:easy_hotel/app/core/extensions/string_ext.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_order_request.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_save_request.dart';
import 'package:easy_hotel/app/data/repository/cars/cars_repository.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/res_cart_manager.dart';
import '../../../../data/model/restaurant/dto/response/item_response.dart';
import '../../../../data/model/restaurant/dto/sales_details_model.dart';
import '../../../../data/model/restaurant/dto/sales_model.dart';
import '../../../../data/repository/restaurant/restaurant_repository.dart';
import '../../../food_cart/controllers/food_cart_controller.dart';

class FoodCheckoutController extends GetxController {
  final user = UserManager();
  var nameController =
      TextEditingController(text: UserManager().user!.name ?? "");
  var userNameController =
      TextEditingController(text: UserManager().user!.name ?? "");
  var phoneController =
      TextEditingController(text: UserManager().user!.mobile ?? "");
  var emailController =
      TextEditingController(text: UserManager().user!.email ?? "");
  var passwordController = TextEditingController();
  var remark = TextEditingController();
  var deliveryPlaceController = TextEditingController();

  final registerForm = GlobalKey<FormState>();
  final loading = false.obs;
  final List<ItemResponse> cartList = Get.arguments;
  final sumPrice = 0.0.obs;
  final deliveryPlace = 0.obs;
  @override
  void onInit() {
    for (var element in cartList) {
      sumPrice(sumPrice.value + (element.sumPrice ?? 0));
    }
    super.onInit();
  }

  Future saveOrder() async {
    if (cartList.isEmpty) {
      return;
    }
    loading(true);
    final request = Sales();
    request.salesDetialList = [];
    request.salesDetialListDeleted = [];
    request.deliveryPlace = 0; // مكان الاستلام
    request.currencySerial = 73; //
    request.gallaryName = "test";
    request.invoiceDate = DateTime.now();
    // request.takeDate = DateTime.;
    // request.offerId ;
    request.remarks = "";
    // request.tax ;
    request.branchId = user.selectedBranch?.id;
    request.companyId = 74;
    request.createdBy = 354;
    request.customerId = user.user?.id;
    request.address = user.user?.address;
    request.customerName = user.user?.name;
    request.customerMobile =
        user.user != null ? user.user?.phone ?? (user.user?.mobile ?? "") : "";
    request.createdDate = DateTime.now();
    request.typeSave = 0;
    request.orderType = 0;
    request.isOpen = 0;
    request.startDate = cartList.last.requiredDate ?? DateTime(request.createdDate!.year , request.createdDate!.month , request.createdDate!.hour ,(request.createdDate!.minute + (cartList.last.time ?? 0)).toInt());
    request.createdByName = user.user?.name;
    for (ItemResponse product in cartList) {
      SalesDetails details = fromProductToSalesDetails(product);
      request.salesDetialList!.add(details);
    }

    await RestaurantRepository().saveOrder(request,
        onComplete: () => loading(false),
        onError: (e) => showPopupText(AppStrings.serverError),
        onSuccess: (_) {
          removeAll();
          showPopupText(AppStrings.savedSuccessfully);
          Get.toNamed(Routes.ALLSERVICES);
        });
  }

  SalesDetails fromProductToSalesDetails(ItemResponse product) {
    SalesDetails details = SalesDetails();
    details.id = product.oldDetailId;
    // details.s = product.serial.toString();
    details.price = product.salePrice ?? product.price;
    details.quantity = double.parse(product.quantity!.toString());
    details.name = product.selectedVariation != null
        ? "${product.name!}-${product.selectedVariation!.variationDetailsName!}"
        : product.name;
    details.groupId = product.groupId;
    details.net = details.price! * details.quantity!;
    details.resItemVariation = product.selectedVariation != null
        ? product.selectedVariation!.id
        : null;
    details.itemId = product.id;
    details.resSalesDetailsAdditionsDTOList = [];
    details.appId = product.appId;
    details.remark = product.remark;
    details.createdDate = DateTime.now();
    details.createdBy = 354;
    details.startDate = product.requiredDate ?? DateTime(details.createdDate!.year , details.createdDate!.month , details.createdDate!.hour ,(details.createdDate!.minute + (product.time ?? 0)).toInt());
    for (int i = 0; i < product.addititonsList!.length; i++) {
      if ((product.addititonsList?[i].selected ?? false) == true) {
        details.additionsList!.add(product.addititonsList![i]);
      }
    }
    return details;
  }

  removeAll() {
    cartList.clear();
    Get.find<FoodCartController>().cartList.clear();
    Get.find<FoodCartController>().removeAll();
    RestaurantCartManager().removeAllFromCart();
  }
}
