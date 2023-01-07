import 'package:easy_hotel/app/data/model/auth/login/dto/response/login_response.dart';
import 'package:easy_hotel/app/data/model/user/dto/request/update_user_put_request.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';

import '../model/restaurant/dto/sales_details_model.dart';

part './mappers/login_response_to_update_user_request.dart';
part './mappers/from_restaurant_item_to_sales_detail.dart';


abstract class Mapper {

  // static UpdateUserPutRequest loginResToUpdateUserReq(LoginResponse loginResponseDto)
  //   => _loginResponseToUpdateUserRequest(loginResponseDto);
  static SalesDetails fromProductToSalesDetails(ItemResponse product) => _fromProductToSalesDetails(product);
}