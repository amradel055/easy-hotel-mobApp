import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/model/hotel_detail/request/hotel_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/hotel_detail/response/hotel_detail_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:easy_hotel/app/data/repository/hotel_search_for_services/hotel_search_for_services_repository.dart';
import 'package:easy_hotel/app/modules/food/food_cart/controllers/food_cart_controller.dart';
import 'package:get/get.dart';

import '../../../data/provider/api_provider.dart';


class HotelDetailsController extends GetxController {

  // final CarsResponse selectedCar = Get.arguments;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final Rxn selectedImage = Rxn() ;
  HotelDetail ?hotelDetail;


  // final Rxn<CarPriceResponse> carPrice = Rxn();
  @override
  void onInit() {
    // Get.isRegistered<FoodCartController>() ? Get.find<FoodCartController>() : Get.put<FoodCartController>(FoodCartController());
    getHotelDetail();
    super.onInit();
  }

  getHotelDetail(){
    isLoading(true);

    final request = HotelDetailRequest(id: UserManager().selectedBranch!.id!);
    HotelSearchForServicesRepository().getHotelDetailById(
      request,
      onSuccess: (data){
        hotelDetail=data.data;

      },
      onComplete: (){
        isLoading(false);
      },
      onError: (e) => showPopupText(e),
    );
  }

  setSelectedImage(String? image){
    selectedImage(image);
  }

}
