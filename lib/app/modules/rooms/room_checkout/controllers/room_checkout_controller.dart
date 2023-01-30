import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_order_request.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/housekeeping/dto/request/housekeeping_save_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_save_request.dart';
import 'package:easy_hotel/app/data/repository/cars/cars_repository.dart';
import 'package:easy_hotel/app/data/repository/housekeeping/housekeeping_repository.dart';
import 'package:easy_hotel/app/data/repository/rooms/rooms_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class RoomCheckoutController extends GetxController {
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final registerForm = GlobalKey<FormState>();
  final isLoading = false.obs;
  final List res = Get.arguments;
  getRoomSave() async {
    isLoading(true);
    SalesDetailRoomDTOModel sale=SalesDetailRoomDTOModel(
        roomId:res[0].id!,
        leavingTime:DateTime.now(),
        arrivalTime: DateTime.now(),
        adaptNumber: res[0].ch!,
        childrenNumber: 3,
        price: res[1],
        addtionsDtoList: res[2],
        phone:UserManager().user!.phone??"",
        email:UserManager().user!.email!,
        name: UserManager().user!.name!,
        purposeType: ""
    );


    final request = RoomsSaveRequest(
        companyId: AppConstants.companyId,
        createdBy: AppConstants.createdBy,
        branchId: 232,
        salesDetailRoomDTOModel:sale
    );
    RoomsRepository().getRoomSave(request,
        onSuccess: (data) {
          showPopupText( "تم الحفظ بنجاح");
          Get.toNamed(Routes.ALLSERVICES);
        },
        onError: (e) => showPopupText( e.toString()),
        onComplete: () => isLoading(false)
    );
  }

}
