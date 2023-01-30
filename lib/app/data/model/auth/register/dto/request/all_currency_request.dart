import 'package:easy_hotel/app/data/model/base_request.dart';

class AllCurrencyRequestDto extends BaseRequest {
  AllCurrencyRequestDto({
    this.companyId,

  });

  int? companyId;


  @override
  Map<String, dynamic> toJson() => {
    "companyId": companyId,

  };
}
