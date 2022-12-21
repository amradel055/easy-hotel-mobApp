import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';

class RoomSearchFilterRequest {
  RoomSearchFilterRequest({
     this.cityId,
     this.hotelId,
     this.childrenNumber,
     this.adaptNumber,
  });

  int ?cityId;
  int ?hotelId;
  int ?childrenNumber;
  int ?adaptNumber;


  Map<String, dynamic> toJson() => {

    "cityId": cityId == null ? null : cityId,
    "hotelId": hotelId == null ? null : hotelId,
    "childrenNumber": childrenNumber == null ? null : childrenNumber,
    "adaptNumber": adaptNumber == null ? null : adaptNumber,


  };
}



