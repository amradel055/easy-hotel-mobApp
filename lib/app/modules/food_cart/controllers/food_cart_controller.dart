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
    RestaurantCartManager().getCartList();
    cartList.assignAll(RestaurantCartManager().cartList);
  }

  add(ItemResponse item) {
    
    cartList.add(item);
    RestaurantCartManager().addToCart(item);
    cartList.refresh();
  }

  remove(int index) {
    cartList.removeAt(index);
    RestaurantCartManager().removeFromCart(index);
  }

  removeAll() {
    cartList.clear();
    RestaurantCartManager().removeAllFromCart();
  }
  

  
  
}
