



import 'dart:convert';

import 'package:easy_hotel/app/core/utils/products_fav_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/model/setting/dto/response/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/show_popup_text.dart';


class FavProductsController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    FavProductsManager().getFavProducts();


  }

  //  final favouriteProducts = <ItemResponse>[].obs;
  // Future addProduct(ItemResponse product , BuildContext context) async{
  //   int index = favouriteProducts.indexWhere((element) => element.id == product.id);
  //   if(index != -1){
  //   }else{
  //     favouriteProducts.add(product);
  //   }
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
  //   showPopupText( "Product added to favourites successfully");
  //
  // }
  // Future getFavProducts() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   favouriteProducts.value = [];
  //   if(prefs.getString(AppConstants.favKey) != null) {
  //     List products = jsonDecode(prefs.getString(AppConstants.favKey)!);
  //     favouriteProducts.value =
  //     List<ItemResponse>.from(products.map((e) => ItemResponse.fromJson(e)));
  //     for(int i = 0 ; i < favouriteProducts.length ; i ++){
  //       favouriteProducts[i].fav = true ;
  //     }
  //   }
  // }
  //
  // Future remove(id , BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   favouriteProducts.removeWhere((product) => product.id == id);
  //   prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
  //   showPopupText( "Product removed from favourites successfully");
  // }
  //
  //
  // Future<bool> isFav(id) async {
  //   await getFavProducts();
  //   int index = favouriteProducts.indexWhere((product) => product.id == id);
  //   if(index == -1 ){
  //     return false ;
  //   }else{
  //     return true ;
  //   }
  // }

}