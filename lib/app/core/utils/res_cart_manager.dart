import 'package:easy_hotel/app.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';

import '../../data/model/restaurant/dto/response/item_response.dart';
import '../../modules/resturant/controllers/resturant_controller.dart';
import 'app_storage.dart';

class RestaurantCartManager {
  static final _restaurantCartManager = RestaurantCartManager._();
  RestaurantCartManager._();
  factory RestaurantCartManager() => _restaurantCartManager;
  
  List<ItemResponse> get cartList => getCartList() ?? [];
  List<ItemResponse> _cart = [];



  List<ItemResponse>? getCartList() {
    _cart = AppStorage.read(AppStorage.CART) == null
        ? []
        : List<ItemResponse>.from(AppStorage.read(AppStorage.CART)
            .map((e) => ItemResponse.fromJson(e)));
    return _cart;
  }

  Future saveCart() async {
    await AppStorage.write(
        AppStorage.CART, List<dynamic>.from(_cart.map((e) => e.toJson())));
    notify();
  }

  addToCart(ItemResponse item) {
    int index = _cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      final item = _cart[index];
      item.quantity = (item.quantity ?? 0) + 1;
      _cart.replaceRange(index, index + 1, [item]);

    }else{
    _cart.add(item);
    }
    saveCart();
    showPopupText("تم الاضافة الي العربة ");
  }

  removeFromCart(int index) {
    _cart.removeAt(index);
    saveCart();
  }

  removeAllFromCart() {
    _cart = [];
    saveCart();
  }

  notify() {
    RestaurantController().cartLength(_cart.length);
    RestaurantController().cartLength.refresh();
  }
}
