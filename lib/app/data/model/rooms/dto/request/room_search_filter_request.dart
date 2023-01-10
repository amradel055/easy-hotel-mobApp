import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';

class RoomSearchFilterRequest {
  RoomSearchFilterRequest({
     this.cityId,
     this.hotelId,
     this.childrenNumber,
     this.adaptNumber,
    this.arrivalTime,
     this.leavingTime,
    this.starNum,
    this.priceFrom,
    this.priceTo,
    this.addtionsDTOList
  });

  int ?cityId;
  int ?hotelId;
  int ?childrenNumber;
  int ?adaptNumber;
  DateTime ?arrivalTime;
  DateTime ?leavingTime;
  int? starNum;
  double?priceFrom;
  double?priceTo;
  List<AddtionsModel>? addtionsDTOList;




  Map<String, dynamic> toJson() => {

    "cityId": cityId == null ? null : cityId,
    "hotelId": hotelId == null ? null : hotelId,
    "childrenNumber": childrenNumber == null ? null : childrenNumber,
    "adaptNumber": adaptNumber == null ? null : adaptNumber,
    "starNum": starNum == null ? null : starNum,
    "priceFrom": priceFrom == null ? null : priceFrom!.toDouble(),
    "priceTo": priceTo == null ? null : priceTo!.toDouble(),
    "arrivalTime": arrivalTime == null ? null : arrivalTime!.toIso8601String(),
    "leavingTime": leavingTime == null ? null : leavingTime!.toIso8601String(),
    // "addtionsDTOList" : List.from(AdditionsGroupModel.addtionsDtoList!.map((e) => e.toJson())),
    // "addtionsDTOList": addtionsDTOList == null ? null : List<AddtionsModel>.from(addtionsDTOList!.map((x) => x.toJson())),
    "addtionsDTOList": addtionsDTOList == null ? null : List<AddtionsModel>.from(addtionsDTOList!.map((x) => x)),




  };
}



