// To parse this JSON data, do
//
//     final hallsModel = hallsModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../item_image_response_dto.dart';



class HallsResponse {
  HallsResponse({
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
    this.loyaltyPoints,
    this.capacity,
    this.appId,
    this.currencySerial,
    this.discountType,
    this.discountValue,
    this.discountRate,
    this.saleItem,
    this.offerId,
    this.occasionsDtoList,
    this.image,
    this.itemImages,
    this.additionsGroupDTOList,
    this.cityId,
    this.salePrice,
  });

  int ?id;
  bool ?markEdit;
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
  num ?price;
  num? loyaltyPoints;
  int ?capacity;
  dynamic appId;
  dynamic currencySerial;
  int ?discountType;
  num? discountValue;
  int ?discountRate;
  bool ?saleItem;
  dynamic offerId;
  dynamic occasionsDtoList;
  dynamic image;
  List<ItemImageResponse>? itemImages;
  List<AdditionsGroupModel> ?additionsGroupDTOList;
  dynamic cityId;
  int ?salePrice;

  static List<HallsResponse> fromList(dynamic json) => List.from(json.map((e) => HallsResponse.fromJson(e)));

  factory HallsResponse.fromJson( dynamic json) => HallsResponse(
    id: json["id"],
    markEdit: json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    index: json["index"],
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
    name: json["name"],
    price: json["price"],
    loyaltyPoints: json["loyaltyPoints"],
    capacity: json["capacity"],
    appId: json["appId"],
    currencySerial: json["currencySerial"],
    discountType: json["discountType"],
    discountValue: json["discountValue"],
    discountRate: json["discountRate"],
    saleItem: json["saleItem"],
    offerId: json["offerId"],
    occasionsDtoList: json["occasionsDTOList"],
    image: json["image"],
    itemImages: ItemImageResponse.fromList(json['itemImages'] ?? []),
    additionsGroupDTOList: List<AdditionsGroupModel>.from((json["additionsGroupDTOList"]??[]).map((x) => AdditionsGroupModel.fromJson(x))),
    cityId: json["cityId"],
    salePrice: json["salePrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "markEdit": markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "index": index,
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
    "name": name,
    "price": price,
    "loyaltyPoints": loyaltyPoints,
    "capacity": capacity,
    "appId": appId,
    "currencySerial": currencySerial,
    "discountType": discountType,
    "discountValue": discountValue,
    "discountRate": discountRate,
    "saleItem": saleItem,
    "offerId": offerId,
    "occasionsDTOList": occasionsDtoList,
    "image": image,
    "itemImages": List<dynamic>.from(itemImages!.map((x) => x)),
    "additionsGroupDTOList": List<AdditionsGroupModel>.from(additionsGroupDTOList!.map((x) => x)),
    "cityId": cityId,
    "salePrice": salePrice,
  };
}


class AdditionsGroupModel {
  AdditionsGroupModel({
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
    this.addtionsDtoList,
    this.appId,
  });

  int ?id;
  bool ?markEdit;
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
  RxList<AddtionsModel>? addtionsDtoList;
  int ?appId;

  static List<AdditionsGroupModel> fromList(dynamic json) => List.from(json.map((e) => AdditionsGroupModel.fromJson(e)));

  factory AdditionsGroupModel.fromRawJson(String str) => AdditionsGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdditionsGroupModel.fromJson(Map<String, dynamic> json) => AdditionsGroupModel(
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
    addtionsDtoList: json["addtionsDTOList"] == null ? null : RxList<AddtionsModel>.from(json["addtionsDTOList"].map((x) => AddtionsModel.fromJson(x))),
    appId: json["appId"] == null ? null : json["appId"],
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
    "addtionsDtoList": addtionsDtoList == null ? null : List<AddtionsModel>.from(addtionsDtoList!.map((x) => x)),
    "appId": appId == null ? null : appId,
  };
}


class AddtionsModel {
  AddtionsModel({
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
    this.serial,
    this.appId,
    this.appName,
    this.itemId,
    this.hallId,
    this.discount,
    this.discountType,
    this.salePrice,
    this.additionsGroupId,
    this.additionsGroupName,
    this.mainAdditionId,
  });

  int? id;
  bool ?markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  dynamic createdBy;
  dynamic createdDate;
  dynamic index;
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
  num ?price;
  dynamic serial;
  dynamic appId;
  dynamic appName;
  dynamic itemId;
  dynamic hallId;
  num ?discount;
  dynamic discountType;
  int ?salePrice;
  dynamic additionsGroupId;
  String? additionsGroupName;
  dynamic mainAdditionId;

  factory AddtionsModel.fromJson(Map<String, dynamic> json) => AddtionsModel(
    id: json["id"],
    markEdit: json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    index: json["index"],
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
    name: json["name"],
    price: json["price"],
    serial: json["serial"],
    appId: json["appId"],
    appName: json["appName"],
    itemId: json["itemId"],
    hallId: json["hallId"],
    discount: json["discount"],
    discountType: json["discountType"],
    salePrice: json["salePrice"],
    additionsGroupId: json["additionsGroupId"],
    additionsGroupName: json["additionsGroupName"],
    mainAdditionId: json["mainAdditionId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "markEdit": markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "index": index,
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
    "name": name,
    "price": price,
    "serial": serial,
    "appId": appId,
    "appName": appName,
    "itemId": itemId,
    "hallId": hallId,
    "discount": discount,
    "discountType": discountType,
    "salePrice": salePrice,
    "additionsGroupId": additionsGroupId,
    "additionsGroupName": additionsGroupName,
    "mainAdditionId": mainAdditionId,
  };
}

