import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:get/get.dart';
import '../../../core/utils/res_cart_manager.dart';
import '../../../core/utils/user_manager.dart';
import '../../../core/values/app_strings.dart';
import '../../../data/model/restaurant/dto/response/item_response.dart';
import '../../../data/model/restaurant/dto/sales_details_model.dart';
import '../../../data/model/restaurant/dto/sales_model.dart';
import '../../../data/repository/restaurant/restaurant_repository.dart';
import '../../../routes/app_pages.dart';

class FoodCartController extends GetxController {
  final cartList = <ItemResponse>[].obs;
  // final count = 0.obs;
  final user = UserManager();
  final isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    cartList.assignAll(RestaurantCartManager().cartList);
  }

  add(ItemResponse item) {
    cartList.add(item);
    RestaurantCartManager().addToCart(item);
  }

  remove(int index) {
    cartList.removeAt(index);
    RestaurantCartManager().removeFromCart(index);
  }

  removeAll() {
    cartList.clear();
    RestaurantCartManager().removeAllFromCart();
  }

  Future saveOrder() async {
    if(cartList.isEmpty){
      return ;
    }
    isLoading(true);
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
    request.createdByName = user.user?.name;
    for (ItemResponse product in cartList) {
      SalesDetails details = fromProductToSalesDetails(product);
      request.salesDetialList!.add(details);
    }

    await RestaurantRepository().saveOrder(request,
        onComplete: () => isLoading(false),
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
    for (int i = 0; i < product.addititonsList!.length; i++) {
      if ((product.addititonsList?[i].selected ?? false) == true) {
        details.additionsList!.add(product.addititonsList![i]);
      }
    }
    return details;
  }
}
