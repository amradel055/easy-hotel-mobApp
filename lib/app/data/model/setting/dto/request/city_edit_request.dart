import 'package:easy_hotel/app/data/model/base_request.dart';

class EditCityRequestDto extends BaseRequest {
  EditCityRequestDto({
    this.id,
    this.cityId,

  });

  int? id;
  int? cityId;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "cityId": cityId,

  };
}
