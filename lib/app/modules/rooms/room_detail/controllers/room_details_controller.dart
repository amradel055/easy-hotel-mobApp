import 'dart:convert';

import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/item_image_response_dto.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_detail_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomDetailController extends GetxController {

  final int id = Get.arguments;
  RxInt  index = 1.obs;
  RxInt  serviceIndex = 0.obs;
  RxInt selectedType = 1.obs;
  RoomResponse? room ;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final Rxn selectedImage = Rxn() ;



  @override
  void onInit() {
    super.onInit();
    getRoomDetail();


  }


  getRoomDetail() async {
    isLoading(true);
    final request = RoomDetailRequest(
      id:id ,

    );
    RoomsRepository().getRoomDetail(request,
        onSuccess: (data) {
          room=data.data;
          selectedImage(room!.image);
          if(room!.itemImages != null &&  room!.image != null ){
            room!.itemImages!.add(ItemImageResponse(image: room!.image));
          }

        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

  setSelectedImage(String? image){
    selectedImage(image);
  }
  final favouriteProducts = <RoomResponse>[].obs;
  Future addProduct(RoomResponse product , BuildContext context) async{
    int index = favouriteProducts.indexWhere((element) => element.id == product.id);
    if(index != -1){
    }else{
      favouriteProducts.add(product);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.favKey, jsonEncode(favouriteProducts));
    showPopupText( "Product added to favourites successfully");

  }
  Future getFavProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteProducts.value = [];
    if(prefs.getString(AppConstants.favKey) != null) {
      List products = jsonDecode(prefs.getString(AppConstants.favKey)!);
      favouriteProducts.value =
      List<RoomResponse>.from(products.map((e) => RoomResponse.fromJson(e)));
      for(int i = 0 ; i < favouriteProducts.length ; i ++){
        favouriteProducts[i].fav = true ;
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
