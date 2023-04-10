import 'package:easy_hotel/app/core/utils/restaurant_strorage.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_storage.dart';
import '../../../../core/utils/show_popup_text.dart';
import '../../../../core/utils/user_manager.dart';
import '../../../../data/model/app_services/dto/request/application_request.dart';
import '../../../../data/model/app_services/dto/response/application_response_dto.dart';
import '../../../../data/repository/hotel_search_for_services/hotel_search_for_services_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../allServices/controllers/all_services_controller.dart';

class FavProductsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final favRestaurantList = <ItemResponse>[].obs;
  final favRoomList = <RoomResponse>[].obs;
  final appServicesList = <ApplicationResponse>[].obs;
  final selectedAppId = 1.obs;
  TabController? tabController;
  final isLoading = false.obs;
  @override
  void onInit() async {
    await getAppServices();
    List<RoomResponse> favRooms = RoomResponse.fromList(
        await AppStorage.read(AppStorage.FAV_ROOMS) ?? []);
    favRoomList(favRooms);
    favRoomList.refresh();
    List<ItemResponse> favFoods =
        await RestaurantStorage.getFavoriteItemsForFav();
    favRestaurantList(favFoods);
    super.onInit();
    // FavProductsManager().getFavProducts();
  }

  Future getAppServices() async {
    isLoading(true);
    final request = ApplicationRequest(id: UserManager().selectedBranch!.id!);
    await HotelSearchForServicesRepository().appServices(
      request,
      onSuccess: (data) async {
        appServicesList.assignAll(data.data);
        tabController =
            TabController(length: appServicesList.length, vsync: this);
      },
      onComplete: () => isLoading(false),
      onError: (e) => showPopupText(e),
    );
  }

  removeforFav(int index) async {
    if (selectedAppId.value == 1) {
      await RestaurantStorage.addItemToFavorite(favRestaurantList[index]);
      favRestaurantList.removeAt(index);
      favRestaurantList.refresh();
      // Get.toNamed(Routes.RESTURANT);
    } else if (selectedAppId.value == 2) {
      // Get.toNamed(Routes.RESTURANT);
    } else if (selectedAppId.value == 3) {
      // Get.toNamed(Routes.CARS,arguments: [imageIn,selectedAppId.value]);
    } else if (selectedAppId.value == 4) {
      // Get.toNamed(Routes.SPADETAILS);
    } else if (selectedAppId.value == 5) {
      // Get.toNamed(Routes.HOUSE_KEEPING,arguments: [imageIn,selectedAppId.value]);
    } else if (selectedAppId.value == 6) {
      // Get.toNamed(Routes.HALLS);
    } else if (selectedAppId.value == 7) {
      await AppStorage.addRoomToFavorite(favRoomList[index]);
      favRoomList.removeAt(index);
      favRoomList.refresh();
      // Get.toNamed(Routes.ROOMS);
    } else if (selectedAppId.value == 8) {
      // Get.toNamed(Routes.POLMAN,arguments: [imageIn,selectedAppId.value]);
    }
  }

    onTap(int index) async {
    if (selectedAppId.value == 1) {
      Get.toNamed(Routes.FOOD_ITEM , arguments: favRestaurantList[index].id);
    } else if (selectedAppId.value == 2) {
      // Get.toNamed(Routes.RESTURANT);
    } else if (selectedAppId.value == 3) {
      // Get.toNamed(Routes.CARS,arguments: [imageIn,selectedAppId.value]);
    } else if (selectedAppId.value == 4) {
      // Get.toNamed(Routes.SPADETAILS);
    } else if (selectedAppId.value == 5) {
      // Get.toNamed(Routes.HOUSE_KEEPING,arguments: [imageIn,selectedAppId.value]);
    } else if (selectedAppId.value == 6) {
      // Get.toNamed(Routes.HALLS);
    } else if (selectedAppId.value == 7) {
      Get.toNamed(Routes.ROOM_DETAIL , arguments:favRoomList[index].id);
    } else if (selectedAppId.value == 8) {
      // Get.toNamed(Routes.POLMAN,arguments: [imageIn,selectedAppId.value]);
    }
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
