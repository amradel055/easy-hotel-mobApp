import 'package:easy_hotel/app/data/model/base_request.dart';

class EditPersonalInfoRequestDto extends BaseRequest {
  EditPersonalInfoRequestDto({
    this.id,
    this.name,
    this.phone,

  });

  int? id;
  String? name;
  String? phone;


  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "phone": phone,

  };
}
