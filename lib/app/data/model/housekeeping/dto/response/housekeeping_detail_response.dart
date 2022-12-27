// To parse this JSON data, do
//
//     final houseKeepingModel = houseKeepingModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';


class HouseKeepingDetailResponse {
  HouseKeepingDetailResponse({
    this.id,
    this.markEdit,
    this.msg,
    this.msgType,
    this.markDisable,
    this.createdBy,
    this.createdDate,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.deletedDate,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.userCode,
    this.name,
    this.price,
    this.groupId,
    this.selected
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int ?createdBy;
  String? createdDate;
  int ?index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? name;
  double ?price;
  int ?groupId;
  RxBool?selected=false.obs;

  static List<HouseKeepingDetailResponse> fromList(dynamic json) => List.from(json.map((e) => HouseKeepingDetailResponse.fromJson(e)));


  factory HouseKeepingDetailResponse.fromJson( dynamic json) => HouseKeepingDetailResponse(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : json["createdDate"],
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"],
    createdByName: json["createdByName"],
    branchId: json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    companyCode: json["companyCode"],
    branchSerial: json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"],
    userCode: json["userCode"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    groupId: json["groupId"] == null ? null : json["groupId"],
    selected: false.obs,

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "groupId": groupId == null ? null : groupId,
    "selected": selected == null ? null : selected,

  };
}
