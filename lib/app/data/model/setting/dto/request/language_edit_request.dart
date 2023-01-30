import 'package:easy_hotel/app/data/model/base_request.dart';

class EditLanguageRequestDto extends BaseRequest {
  EditLanguageRequestDto({
    this.id,
    this.languageId,

  });

  int? id;
  int? languageId;


  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "languageId": languageId,

  };
}
