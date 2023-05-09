import 'package:easy_hotel/app/data/model/base_request.dart';

class RegisterRequestDto extends BaseRequest {
  RegisterRequestDto({
    this.phone,
    this.email,
    this.password  = "",
    this.name,
    this.userName,
    this.cityId,
    this.currencyId,
    this.languageId
  });

  String? phone;
  String? name;
  String? userName;
  String? email;
  String? password;
  int?cityId;
  int?currencyId;
  int?languageId;

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "userName": userName,
    "phone": phone,
    "email": email,
    "password": password,
    "cityId": cityId,
    "currencyId": currencyId,
    "languageId": languageId,
  };
}
