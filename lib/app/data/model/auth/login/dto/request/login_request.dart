import 'package:easy_hotel/app/data/model/base_request.dart';

class LoginRequestDto extends BaseRequest {
  LoginRequestDto({this.userName, this.password, this.phone});

  String? userName;
  String? password;
  String? phone;

  @override
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "phone": phone,
      };
}
