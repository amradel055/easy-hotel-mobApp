

import 'package:easy_hotel/app.dart';

import '../../data/model/restaurant/dto/response/item_response.dart';
import 'app_storage.dart';

class RestaurantCartManager {
  static final _restaurantCartManager = RestaurantCartManager._();
  RestaurantCartManager._();
  factory RestaurantCartManager() => _restaurantCartManager ;

  List<ItemResponse> get cartList => getCartList() ?? [] ;
  List<ItemResponse> _cart = [] ;
  List<ItemResponse>? getCartList(){
    _cart = AppStorage.read(AppStorage.CART) == null ?
    [] : List<ItemResponse>.from(AppStorage.read(AppStorage.CART).map((e) => ItemResponse.fromJson(e)));
    return _cart ;
  }


 Future saveCart()async{
   await AppStorage.write(AppStorage.CART, List<dynamic>.from(_cart.map((e) => e.toJson())));
  }
  addToCart(ItemResponse item){
    _cart.add(item);
    saveCart();
  }
  removeFromCart(int index){
    _cart.removeAt(index);
    saveCart();
  }
  removeAllFromCart(){
    _cart = [];
    saveCart();
  }
}