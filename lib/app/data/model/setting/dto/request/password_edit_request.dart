import 'package:easy_hotel/app/data/model/base_request.dart';

class EditPaswordRequestDto extends BaseRequest {
  EditPaswordRequestDto({
    this.id,
    this.password,
    this.oldPassword,

  });

  int? id;
  String? password;
  String? oldPassword;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "oldPassword": oldPassword,
    "password": password,

  };
}
