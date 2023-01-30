import 'package:easy_hotel/app/data/model/base_request.dart';

class EditCurrencyRequestDto extends BaseRequest {
  EditCurrencyRequestDto({
    this.id,
    this.currencyId,

  });

  int? id;
  int? currencyId;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "currencyId": currencyId,

  };
}
