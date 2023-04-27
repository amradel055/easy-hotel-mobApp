import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final showLogo = false.obs;

  @override
  void onReady() async{
    super.onReady();
    await Future.delayed(const Duration(seconds: 1));
    showLogo(true);
    await Future.delayed(const Duration(seconds: 2));
    if(UserManager().isLoggedIn){
      if(UserManager().selectedBranch !=null){
        Get.offNamed(Routes.ALLSERVICES);
      }else{
      Get.offNamed(Routes.HOME);
      }
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
