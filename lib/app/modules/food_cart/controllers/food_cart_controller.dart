import 'package:get/get.dart';
import '../../../core/utils/res_cart_manager.dart';
import '../../../data/model/restaurant/dto/response/item_response.dart';

class FoodCartController extends GetxController {

  final cartList = <ItemResponse>[].obs ;
  // final count = 0.obs;


  @override
  onInit(){
    super.onInit();
    cartList.assignAll(RestaurantCartManager().cartList);
  }



  add(ItemResponse item){
    cartList.add(item);
    RestaurantCartManager().addToCart(item);
  }
  remove(int index){
    cartList.removeAt(index);
    RestaurantCartManager().removeFromCart(index);
  }

  removeAll(){
    cartList.clear();
    RestaurantCartManager().removeAllFromCart();
  }


}
