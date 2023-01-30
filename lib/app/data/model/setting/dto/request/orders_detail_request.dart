import 'package:easy_hotel/app/data/model/base_request.dart';

class OrdersDetailRequestDto extends BaseRequest {
  OrdersDetailRequestDto({
    this.id,
    this.appId,

  });

  int? id;
  int? appId;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "appId": appId,

  };
}
