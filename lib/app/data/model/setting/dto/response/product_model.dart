

import 'package:flutter/material.dart';
import '../../../restaurant/dto/response/attribute_model.dart';
import '../../../restaurant/dto/response/review_model.dart';
import '../../../restaurant/dto/response/variation_model.dart';


class ProductModel {
  ProductModel({
    this.id,
    this.markEdit,
    this.msg,
    this.msgType,
    this.markDisable,
    this.createdBy,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.igmaOwnerId,
    this.serial,
    this.name,
    this.groupId,
    this.price,
    this.time,
    this.discribtion,
    this.unitId,
    this.remark,
    this.image,
    this.appId,
    this.saleItem,
    this.salePrice,
    this.attributeList ,
    this.variationsList ,
    this.addititonsList ,
    this.quantity ,
    this.fav ,
    this.itemImages ,
    this.selectedVariation,
    this.reviewsList ,
    this.reviewsStars,
    this.discountRate,
    this.discountValue,
    this.startDate,
    this.endDateDelivery,
    this.differentTime,
    this.waitingTimeDelivery,
    this.endDatePacking
  });
  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  int? index;
  int? companyId;
  String? createdByName;
  int? branchId;
  int? deletedBy;
  int? igmaOwnerId;
  int? serial;
  String? name;
  int? groupId;
  double? price;
  int ?time;
  String? discribtion;
  int? unitId;
  String? remark;
  String? image;
  int? appId;
  bool? saleItem;
  double? salePrice;
  int? quantity = 1 ;
  List<Attribute>? attributeList;
  List<Variation>? variationsList;
  List<Additions>? addititonsList;
  List<ImageModel>? itemImages ;
  List<ReviewModel>? reviewsList;
  double? reviewsStars ;
  bool? fav = false;
  Variation? selectedVariation;
  num?discountRate;
  num?discountValue;
  DateTime ? startDate;
  DateTime? endDateDelivery;
  int? differentTime;
  int?waitingTimeDelivery;
  int?endDatePacking;
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    createdByName: json["createdByName"] == null ? null : json["createdByName"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    deletedBy: json["deletedBy"] == null ? null : json["deletedBy"],
    igmaOwnerId: json["igmaOwnerId"] == null ? null : json["igmaOwnerId"],
    serial: json["serial"] == null ? null : json["serial"],
    name: json["name"] == null ? null : json["name"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    price: json["price"] == null ? null : json["price"],
    time: json["time"],
    discribtion: json["discribtion"] == null ? null : json["discribtion"],
    unitId: json["unitId"] == null ? null : json["unitId"],
    remark: json["remark"] == null ? null : json["remark"],
    image: json["image"] == null ? null : json["image"],
    appId: json["appId"] == null ? null : json["appId"],
    saleItem: json["saleItem"] == null ? null : json["saleItem"],
    salePrice: json["salePrice"] == null ? null : json["salePrice"],
    attributeList: json["attributeList"] == null ? null : List<Attribute>.from(json["attributeList"].map((x) => Attribute.fromJson(x))),
    variationsList: json["variationsList"] == null ? null : List<Variation>.from(json["variationsList"].map((x) => Variation.fromJson(x))),
    addititonsList: json["addtionsDTOList"] == null ? null : List<Additions>.from(json["addtionsDTOList"].map((x) => Additions.fromJson(x))),
    itemImages: json["itemImages"] == null ? null : List<ImageModel>.from(json["itemImages"].map((x) => ImageModel.fromJson(x))),
    reviewsList: json["reviewsList"] == null ? null : List<ReviewModel>.from(json["reviewsList"].map((x) => ReviewModel.fromJson(x))),
    quantity: json["quantity"] == null ? 1 : json["quantity"] ,
    reviewsStars: json["reviewsStars"] == null ? null : json["reviewsStars"] ,
    fav : false ,
    selectedVariation: json["selectedVariation"] == null ? null : Variation.fromJson(json["selectedVariation"])
    ,    discountRate: json["discountRate"] == null ? null : json["discountRate"],
    discountValue: json["discountValue"] == null ? null : json["discountValue"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDateDelivery: json["endDateDelivery"] == null ? null : DateTime.parse(json["endDateDelivery"]),
    differentTime: json["differentTime"] == null ? null : json["differentTime"],
    waitingTimeDelivery: json["waitingTimeDelivery"] == null ? null : json["waitingTimeDelivery"],
    endDatePacking: json["endDatePacking"] == null ? null : json["endDatePacking"],



  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "index": index == null ? null : index,
    "companyId": companyId == null ? null : companyId,
    "createdByName": createdByName == null ? null : createdByName,
    "branchId": branchId == null ? null : branchId,
    "deletedBy": deletedBy == null ? null : deletedBy,
    "igmaOwnerId": igmaOwnerId == null ? null : igmaOwnerId,
    "serial": serial == null ? null : serial,
    "name": name == null ? null : name,
    "groupId": groupId == null ? null : groupId,
    "price": price == null ? null : price,
    "time": time,
    "discribtion": discribtion == null ? null : discribtion,
    "unitId": unitId == null ? null : unitId,
    "remark": remark == null ? null : remark,
    "image": image == null ? null : image,
    "appId": appId == null ? null : appId,
    "saleItem": saleItem == null ? null : saleItem,
    "salePrice": salePrice == null ? null : salePrice,
    "attributeList": attributeList == null ? null : List<dynamic>.from(attributeList!.map((x) => x.toJson())),
    "variationsList": variationsList == null ? null : List<dynamic>.from(variationsList!.map((x) => x.toJson())),
    "addtionsDTOList": addititonsList == null ? null : List<dynamic>.from(addititonsList!.map((x) => x.toJson())),
    "reviewsList" :reviewsList == null ? null : List<dynamic>.from(reviewsList!.map((e) => e.toJson())),
    "reviewsStars" : reviewsStars == null ? null : reviewsStars ,
    "itemImages" : itemImages == null ? null : List<dynamic>.from(itemImages!.map((x) => x.toJson())),
    "quantity" : quantity ,
    "selectedVariation" : selectedVariation == null ? null :  selectedVariation,
    "discountRate": discountRate == null ? null : discountRate,
    "discountValue": discountValue == null ? null : discountValue,
    "startDate": startDate == null ? null : startDate!.toIso8601String(),
    "endDateDelivery": endDateDelivery == null ? null : endDateDelivery!.toIso8601String(),
    "differentTime": differentTime == null ? null : differentTime,
    "waitingTimeDelivery": waitingTimeDelivery == null ? null : waitingTimeDelivery,
    "endDatePacking": endDatePacking == null ? null : endDatePacking,



  };
}

// To parse this JSON data, do
//
//     final additions = additionsFromJson(jsonString);



class Additions {
  Additions({
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
    this.name,
    this.price,
    this.appId,
    this.appName,
    this.selected
  });
  bool? selected = false;
  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  dynamic createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  String? name;
  double? price;
  int? appId;
  String? appName;

  factory Additions.fromJson(Map<String, dynamic> json) => Additions(
      id: json["id"] == null ? null : json["id"],
      markEdit: json["markEdit"] == null ? null : json["markEdit"],
      msg: json["msg"],
      msgType: json["msgType"],
      markDisable: json["markDisable"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      createdDate: json["createdDate"],
      index: json["index"] == null ? null : json["index"],
      companyId: json["companyId"],
      createdByName: json["createdByName"],
      branchId: json["branchId"],
      deletedBy: json["deletedBy"],
      deletedDate: json["deletedDate"],
      igmaOwnerId: json["igmaOwnerId"],
      name: json["name"] == null ? null : json["name"],
      price: json["price"] == null ? null : json["price"],
      appId: json["appId"] == null ? null : json["appId"],
      appName: json["appName"] == null ? null : json["appName"],
      selected:json["selected"] == null ? false : json["selected"]
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "appId": appId == null ? null : appId,
    "appName": appName == null ? null : appName,
    "selected" : selected == null ? null : selected
  };
}


class ImageModel {
  ImageModel({
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
    this.itemId,
    this.image,
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  dynamic createdDate;
  int? index;
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
  int? itemId;
  String? image;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"],
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
    itemId: json["itemId"] == null ? null : json["itemId"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate,
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
    "itemId": itemId == null ? null : itemId,
    "image": image == null ? null : image,
  };
}


