
import 'dart:convert';

import 'package:get/get.dart';


class MaintenanceDetailResponse {
  MaintenanceDetailResponse({
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
    this.discountType,
    this.discountValue,
    this.discountRate,
    this.saleItem,
    this.offerId,
    this.serviceTypeId,
    this.salePrice,
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
  int?discountType;
  double?discountValue;
  int?discountRate;
  bool?saleItem;
  int?offerId;
  int?serviceTypeId;
  double?salePrice;
  RxBool?selected=false.obs;

  static List<MaintenanceDetailResponse> fromList(dynamic json) => List.from(json.map((e) => MaintenanceDetailResponse.fromJson(e)));


  factory MaintenanceDetailResponse.fromJson( dynamic json) => MaintenanceDetailResponse(
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
    discountType: json["discountType"] == null ? null : json["discountType"],
    discountValue: json["discountValue"] == null ? null : json["discountValue"].toDouble(),
    discountRate: json["discountRate"] == null ? null : json["discountRate"],
    saleItem: json["saleItem"] == null ? null : json["saleItem"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
    salePrice: json["salePrice"] == null ? null : json["salePrice"].toDouble(),
    selected: false.obs,

  );

  Map<String, dynamic> toJson() => {
    "id": null,
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
  "discountType": discountType == null ? null : discountType,
  "discountValue": discountValue == null ? null : discountValue,
  "discountRate": discountRate == null ? null : discountRate,
  "saleItem": saleItem == null ? null : saleItem,
  "offerId": offerId == null ? null : offerId,
  "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
  "salePrice": salePrice == null ? null : salePrice,
    // "selected": selected == null ? null : selected,

  };
}
