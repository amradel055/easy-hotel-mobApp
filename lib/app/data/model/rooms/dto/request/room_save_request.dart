import 'dart:convert';

import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
class RoomsSaveRequest {
  RoomsSaveRequest({
    this.branchId,
    this.createdBy,
    this.companyId,
    this.salesDetailRoomDTOModel,

  });

  int? branchId;
  int?createdBy;
  int?companyId;
  SalesDetailRoomDTOModel ? salesDetailRoomDTOModel ;


  factory RoomsSaveRequest.fromJson( dynamic json) => RoomsSaveRequest(

      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      salesDetailRoomDTOModel: json["salesDetailRoomDTOModel"] == null ? null : json["salesDetailRoomDTOModel"],



  );

  Map<String, dynamic> toJson() => {

    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "salesDetailRoomDTOModel": salesDetailRoomDTOModel == null ? null : salesDetailRoomDTOModel!.toJson(),
  // salesDetailRoomDTOModel = SalesDetailRoomDTOModel.fromJson(value);

};
}

class SalesDetailRoomDTOModel {
  SalesDetailRoomDTOModel({
    this.id,
    this.msg,
    this.msgType,
    this.createdBy,
    this.createdDate,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.roomId,
    this.leavingTime,
    this.arrivalTime,
    this.adaptNumber,
    this.childrenNumber,
    this.price,
    this.addtionsDtoList,
    this.phone,
    this.email,
    this.name,
    this.purposeType
  });

  int ?id;
  String? msg;
  int ?msgType;
  int ?createdBy;
  DateTime? createdDate;
  int ?companyId;
  String? createdByName;
  int ?branchId;
  int ?igmaOwnerId;
  String ?companyCode;
  int ?branchSerial;
  int ?igmaOwnerSerial;
  int ?roomId;
  DateTime? leavingTime;
  DateTime? arrivalTime;
  int ?adaptNumber;
  int ?childrenNumber;
  num? price;
  List<AddtionsModel>? addtionsDtoList;
  String ?phone;
  String?email;
  String?name;
  String?purposeType;
  factory SalesDetailRoomDTOModel.fromRawJson(String str) => SalesDetailRoomDTOModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesDetailRoomDTOModel.fromJson( dynamic json) => SalesDetailRoomDTOModel(
    id: json["id"] == null ? null : json["id"],
    msg: json["msg"] == null ? null : json["msg"],
    msgType: json["msgType"] == null ? null : json["msgType"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : json["createdDate"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    createdByName: json["createdByName"] == null ? null : json["createdByName"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    igmaOwnerId: json["igmaOwnerId"] == null ? null : json["igmaOwnerId"],
    companyCode: json["companyCode"] == null ? null : json["companyCode"],
    branchSerial: json["branchSerial"] == null ? null : json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"] == null ? null : json["igmaOwnerSerial"],
    roomId: json["roomId"] == null ? null : json["roomId"],
    leavingTime: json["leavingTime"] == null ? null : json["leavingTime"],
    arrivalTime: json["arrivalTime"] == null ? null : json["arrivalTime"],
    adaptNumber: json["adaptNumber"] == null ? null : json["adaptNumber"],
    childrenNumber: json["childrenNumber"] == null ? null : json["childrenNumber"],
    price: json["price"] == null ? null : json["price"],
    addtionsDtoList: json["addtionsDTOList"] == null ? null : List<AddtionsModel>.from(json["addtionsDTOList"].map((x) => x)),
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    purposeType: json["purposeType"] == null ? null : json["purposeType"],

  );

  Map<String, dynamic> toJson()=> {
    "id": id == null ? null : id,
    "msg": msg == null ? null : msg,
    "msgType": msgType == null ? null : msgType,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "companyId": companyId == null ? null : companyId,
    "createdByName": createdByName == null ? null : createdByName,
    "branchId": branchId == null ? null : branchId,
    "igmaOwnerId": igmaOwnerId == null ? null : igmaOwnerId,
    "companyCode": companyCode == null ? null : companyCode,
    "branchSerial": branchSerial == null ? null : branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial == null ? null : igmaOwnerSerial,
    "roomId": roomId == null ? null : roomId,
    "leavingTime": leavingTime == null ? null : leavingTime!.toIso8601String(),
    "arrivalTime": arrivalTime == null ? null : arrivalTime!.toIso8601String(),
    "adaptNumber": adaptNumber == null ? null : adaptNumber,
    "childrenNumber": childrenNumber == null ? null : childrenNumber,
    "price": price == null ? null : price,
    "addtionsDTOList": addtionsDtoList == null ? null : List<AddtionsModel>.from(addtionsDtoList!.map((x) => x)),
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "purposeType": purposeType == null ? null : purposeType,

  };
}
