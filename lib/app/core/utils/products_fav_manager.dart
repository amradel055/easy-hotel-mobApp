

import 'dart:convert';

import 'package:easy_hotel/app.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/restaurant/dto/response/item_response.dart';
import '../values/app_constants.dart';
import 'app_storage.dart';
class FavProductsManager {
  final favouriteProducts = <ItemResponse>[].obs;
  // List<ItemResponse> favouriteProducts = [] ;

  Future addProduct(ItemResponse product , BuildContext context) async{
    int index = favouriteProducts.indexWhere((element) => element.id == product.id);
    if(index != -1){
    }else{
      favouriteProducts.add(product);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts.value));
    showPopupText( "Product added to favourites successfully");
    print(favouriteProducts.length);

  }
  Future getFavProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteProducts.clear();
    if(prefs.getString(AppConstants.favKey) != null) {
      List products = jsonDecode(prefs.getString(AppConstants.favKey)!);
      favouriteProducts.value =
      List<ItemResponse>.from(products.map((e) => ItemResponse.fromJson(e)));
      for(int i = 0 ; i < favouriteProducts.length ; i ++){
        favouriteProducts[i].fav!.value = true ;
      }
    }
  }

  Future remove(id , BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteProducts.removeWhere((product) => product.id == id);
    prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
    showPopupText( "Product removed from favourites successfully");
  }


  Future<bool> isFav(id) async {
    await getFavProducts();
    int index = favouriteProducts.indexWhere((product) => product.id == id);
    if(index == -1 ){
      return false ;
    }else{
      return true ;
    }
  }

}
