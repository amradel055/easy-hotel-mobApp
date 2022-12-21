import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/allServices/services_model.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AllServicesController extends GetxController {

List<ServiceModel> allServices=[
  ServiceModel(name: AppStrings.spaService, image: AppAssets.spa, pageRoute: Routes.SPADETAILS),
  ServiceModel(name: AppStrings.foodService, image: AppAssets.restraunt, pageRoute: Routes.RESTURANT),
  ServiceModel(name: AppStrings.hallsService, image: AppAssets.halls, pageRoute: Routes.HALLS),
  ServiceModel(name: AppStrings.housekeepingService, image: AppAssets.housekeeping, pageRoute: Routes.HOUSE_KEEPING),
  ServiceModel(name: AppStrings.roomsService, image: AppAssets .rooms, pageRoute: Routes.ROOMS),
  ServiceModel(name: AppStrings.polmanService, image: AppAssets.polman, pageRoute: Routes.POLMAN),
  ServiceModel(name: AppStrings.carsServices, image: AppAssets.cars  , pageRoute: Routes.CARS)
];
}
