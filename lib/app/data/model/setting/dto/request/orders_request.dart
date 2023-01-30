import 'package:easy_hotel/app/data/model/base_request.dart';

class OrdersRequestDto extends BaseRequest {
  OrdersRequestDto({
    this.id,

  });

  int? id;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,

  };
}
