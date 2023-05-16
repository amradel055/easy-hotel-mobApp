import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_response_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/request/halls_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/hall_detail_response.dart';
import 'package:easy_hotel/app/data/repository/halls/halls_repository.dart';
import 'package:get/get.dart';

import '../../../../data/model/item_image_response_dto.dart';

class CarDetailsController extends GetxController {

  final CarsResponse selectedCar = Get.arguments;
  final isLoading = false.obs;
  final servicesSelected = <int>[].obs;
  final Rxn selectedImage = Rxn() ;
  // final Rxn<CarPriceResponse> carPrice = Rxn();
  @override
  void onInit() {
    super.onInit();
  }




  setSelectedImage(String? image){
    selectedImage(image);
  }

}
