import 'package:easy_hotel/app/data/model/base_request.dart';

class RegisterRequestDto extends BaseRequest {
  RegisterRequestDto({
    this.mobile,
    this.email,
    this.password  = "",
    this.name,
    this.userName,
    this.cityId,
    this.currencyId,
    this.languageId
  });

  String? mobile;
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
    "mobile": mobile,
    "email": email,
    "password": password,
    "cityId": cityId,
    "currencyId": currencyId,
    "languageId": languageId,
  };
}
