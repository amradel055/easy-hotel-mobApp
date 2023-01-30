import 'package:easy_hotel/app/data/model/base_request.dart';

class AllCitiesRequestDto extends BaseRequest {
  AllCitiesRequestDto({
    this.branchId,

  });

  int? branchId;


  @override
  Map<String, dynamic> toJson() => {
    "branchId": branchId,

  };
}
