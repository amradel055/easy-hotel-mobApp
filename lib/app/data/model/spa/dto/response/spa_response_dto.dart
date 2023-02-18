
import 'package:get/get.dart';

import 'spa_offer_response.dart';

class SpaResponse {
  SpaResponse({
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
    this.discription,
    this.active,
    this.activeName,
    this.groupId,
    this.groupName,
    this.image,
    this.itemImages,
    this.workHoursDTOs,
    this.lang,
    this.lat,
    this.spaItemsDtoList,
    this.offersDetailsDTOList,
    this.offersDTOList,
    this.address,
    this.reviewDtoList,
    this.hotelName,
    this.cityName,
    this.reviewStar

  });

  int ?id;
  bool ?markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int ? createdBy;
  String ? createdDate;
  String ? hotelName;
  String ? cityName;
  int ? index;
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
  String ? discription;
  bool ? active;
  String ? activeName;
  int ?groupId;
  String? groupName;
  dynamic image;
  List<ImageModel>? itemImages;
  List<WorkHoursDtosModel>? workHoursDTOs;
  dynamic lang;
  double? reviewStar;
  dynamic lat;
  List<SpaItemModel> ? spaItemsDtoList;
  List<SpaOfferResponse> ? offersDetailsDTOList;
  List<SpaOfferResponse> ? offersDTOList;
  String? address;
  List<ReviewModel>? reviewDtoList;

  static List<SpaResponse> fromList(dynamic json) => List.from(json.map((e) => SpaResponse.fromJson(e)));

  factory SpaResponse.fromJson( dynamic json) => SpaResponse(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    hotelName: json["hotelName"] == null ? null : json["hotelName"],
    cityName: json["cityName"] == null ? null : json["cityName"],
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
    discription: json["discription"] == null ? null : json["discription"],
    active: json["active"] == null ? null : json["active"],
    activeName: json["activeName"] == null ? null : json["activeName"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    groupName: json["groupName"] == null ? null : json["groupName"],
    image: json["image"],
    itemImages: json["itemImages"] == null ? null : List<ImageModel>.from(json["itemImages"].map((x) => ImageModel.fromJson(x))),
    workHoursDTOs: json["workHoursDTOs"] == null ? null : List<WorkHoursDtosModel>.from(json["workHoursDTOs"].map((x) => WorkHoursDtosModel.fromJson(x))),
    lang: json["lang"],
    lat: json["lat"],
    spaItemsDtoList: json["spaItemsDTOList"] == null ? null : List<SpaItemModel>.from(json["spaItemsDTOList"].map((x) => SpaItemModel.fromJson(x) )),
    offersDetailsDTOList: json["offersDetailsDTOList"] == null ? null : List<SpaOfferResponse>.from(json["offersDetailsDTOList"].map((x) => SpaOfferResponse.fromJson(x) )),
    offersDTOList: json["offersDTOList"] == null ? null : List<SpaOfferResponse>.from(json["offersDTOList"].map((x) => SpaOfferResponse.fromJson(x) )),
    address: json["address"] == null ? null : json["address"],
    reviewDtoList: json["reviewDTOList"] == null ? null : List<ReviewModel>.from(json["reviewDTOList"].map((x) =>ReviewModel.fromJson(x))),
    reviewStar: json["reviewStar"] == null ? null : json["reviewStar"],

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
    "cityName": cityName == null ? null : cityName,
    "hotelName": hotelName == null ? null : hotelName,
    "discription": discription == null ? null : discription,
    "active": active == null ? null : active,
    "activeName": activeName == null ? null : activeName,
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,
    "image": image,
    "itemImages": itemImages == null ? null : List<ImageModel>.from(itemImages!.map((x) => x)),
    "workHoursDTOs": workHoursDTOs == null ? null : List<WorkHoursDtosModel>.from(workHoursDTOs!.map((x) => x)),
    "lang": lang,
    "lat": lat,
    "spaItemsDTOList": spaItemsDtoList == null ? null : List<SpaItemModel>.from(spaItemsDtoList!.map((x) => x)),
    "offersDetailsDTOList": offersDetailsDTOList == null ? null : List<SpaOfferResponse>.from(offersDetailsDTOList!.map((x) => x)),
    "offersDTOList": offersDTOList == null ? null : List<SpaOfferResponse>.from(offersDTOList!.map((x) => x)),
    "address": address == null ? null : address,
    "reviewDTOList": reviewDtoList == null ? null : List<ReviewModel>.from(reviewDtoList!.map((x) => x)),
    "reviewStar": reviewStar == null ? null : reviewStar,
  };
}

class SpaItemModel {
  SpaItemModel({
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
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.userCode,
    this.spaId,
    this.price,
    this.salePrice,
    this.image,
  this.discountType,
  this.discountValue,
  this.offerId,
  this.onSale,
    this.spaItemId,
    this.spaItemName,
    this.name,
    this.groupId,
    this.groupName
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  DateTime? createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? spaItemName;
  String? name;
  String? image;
  int? spaId;
  double? price;
  double? salePrice;
  int? discountType;
  int? offerId;
  int? spaItemId;
  double? discountValue;
  bool? onSale;
  int? groupId;
  String? groupName;


  factory SpaItemModel.fromJson( dynamic json) => SpaItemModel(
      id: json["id"] == null ? null : json["id"],
    spaItemId: json["spaItemId"] == null ? null : json["spaItemId"],
      markEdit: json["markEdit"] == null ? null : json["markEdit"],
      msg: json["msg"],
      msgType: json["msgType"],
      markDisable: json["markDisable"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]) ,
      index: json["index"] == null ? null : json["index"],
      companyId: json["companyId"],
      createdByName: json["createdByName"],
      branchId: json["branchId"],
      deletedBy: json["deletedBy"],
      igmaOwnerId: json["igmaOwnerId"],
      companyCode: json["companyCode"],
      branchSerial: json["branchSerial"],
      igmaOwnerSerial: json["igmaOwnerSerial"],
      userCode: json["userCode"],
      spaId: json["spaId"] == null ? null : json["spaId"],
      price: json["price"] == null ? null : json["price"],
      salePrice: json["salePrice"] == null ? null : json["salePrice"].toDouble(),
      image: json["image"] == null ? null : json["image"],
    discountType: json["discountType"] == null ? null : json["discountType"],
    offerId: json["offerId"] == null ? null : json["offerId"],
    discountValue: json["discountValue"] == null ? null : json["discountValue"].toDouble(),
    onSale: json["onSale"] == null ? null : json["onSale"],
    spaItemName: json["spaItemName"] == null ? null : json["spaItemName"],
    name: json["name"] == null ? null : json["name"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    groupName: json["groupName"] == null ? null : json["groupName"],
  );

  Map<String, dynamic> toJson() => {
    "id": null,
    "spaItemId": spaItemId == null ? null : spaItemId,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "spaItemName": spaItemName == null ? null : spaItemName,
    "spaId": spaId == null ? null : spaId,
    "salePrice": salePrice == null ? null : salePrice,
    "price": price == null ? null : price,
    "image": image == null ? null : image,
    "discountType": discountType == null ? null : discountType,
    "offerId": offerId == null ? null : offerId,
    "discountValue": discountValue == null ? null : discountValue,
    "onSale": onSale == null ? null : onSale,
    "name": name == null ? null : name,
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,
  };
}

class ReviewModel {
  ReviewModel({
    this.id,
    this.itemId,
    this.appId,
    this.invOrganizationId,
    this.reviewDate,
    this.creationDate,
    this.reviewStars,
    this.reviewText,
    this.customerName
  });

  int? itemId;
  int? appId;
  int? invOrganizationId;
  double? reviewStars;
  DateTime? reviewDate;
  DateTime? creationDate;
  String? reviewText;
  String? customerName;
  int? id;

  static List<ReviewModel> fromList(dynamic json) => List<ReviewModel>.from(json.map((e) => ReviewModel.fromJson(e)));

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json["id"] == null ? null : json["id"],
    reviewDate: json["reviewDate"] == null ? null : DateTime.parse(json["reviewDate"]),
    creationDate: json["creationDate"] == null ? null : DateTime.parse(json["creationDate"]),
    reviewStars: json["reviewStars"] == null ? null : json["reviewStars"].toDouble(),
    itemId: json["itemId"] == null ? null : json["itemId"],
    appId: json["appId"] == null ? null : json["appId"],
    invOrganizationId: json["invOrganizationId"] == null ? null : json["invOrganizationId"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    reviewText: json["reviewText"] == null ? null : json["reviewText"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "reviewDate": reviewDate == null ? null : reviewDate!.toIso8601String(),
    "creationDate": creationDate == null ? null : creationDate!.toIso8601String(),
    "reviewStars": reviewStars == null ? null : reviewStars,
    "itemId": itemId == null ? null : itemId,
    "appId": appId == null ? null : appId,
    "invOrganizationId": invOrganizationId == null ? null : invOrganizationId,
    "customerName": customerName == null ? null : customerName,
    "reviewText": reviewText == null ? null : reviewText,
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


class WorkHoursDtosModel {
  WorkHoursDtosModel({
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
    this.fromHour,
    this.toHour,
    this.fromDate,
    this.toDate,
    this.appId,
    this.appName,
    this.itemId,
    this.itemName,
  });

  int? id;
  bool? markEdit;
  dynamic? msg;
  dynamic? msgType;
  dynamic? markDisable;
  int ?createdBy;
  String ?createdDate;
  int ?index;
  dynamic? companyId;
  dynamic? createdByName;
  dynamic? branchId;
  dynamic? deletedBy;
  dynamic? deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? fromHour;
  String? toHour;
  String? fromDate;
  String? toDate;
  int ?appId;
  String? appName;
  int ?itemId;
  dynamic itemName;



  factory WorkHoursDtosModel.fromJson(Map<String, dynamic> json) => WorkHoursDtosModel(
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
    fromHour: json["fromHour"] == null ? null : json["fromHour"],
    toHour: json["toHour"] == null ? null : json["toHour"],
    fromDate: json["fromDate"] == null ? null : json["fromDate"],
    toDate: json["toDate"] == null ? null : json["toDate"],
    appId: json["appId"] == null ? null : json["appId"],
    appName: json["appName"] == null ? null : json["appName"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    itemName: json["itemName"],
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
    "fromHour": fromHour == null ? null : fromHour,
    "toHour": toHour == null ? null : toHour,
    "fromDate": fromDate == null ? null : fromDate,
    "toDate": toDate == null ? null : toDate,
    "appId": appId == null ? null : appId,
    "appName": appName == null ? null : appName,
    "itemId": itemId == null ? null : itemId,
    "itemName": itemName,
  };
}

