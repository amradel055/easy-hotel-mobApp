// To parse this JSON data, do
//
//     final roomsModel = roomsModelFromJson(jsonString);

import 'dart:convert';

import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:easy_hotel/app/data/model/item_image_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';


class RoomResponse {
  RoomResponse({
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
    this.address,
    this.numBeds,
    this.numBalconies,
    this.numBathrooms,
    this.image,
    this.price,
    this.additionsGroupDTOList,
    this.roomAdditionDTOList,
    this.onSale,
    this.evaluation,
    this.cleanEvaluation,
    this.recipeEvaluation,
    this.clientsEvaluation,
    this.teamWorkEvaluation,
    this.appId,
    this.itemImages,
    this.salePrice,
    this.description,
    this.branchName,
    this.groupRemarkDTOList,
    this.discountType,
    this.discountRate,
    this.saleItem,
    this.offerId,
    this.discountValue,
    this.lang,
    this.lat,
    this.childrenNumber,
    this.adaptNumber,
    this.fav ,




  }): localId = idCount++;
  static int idCount = 0;
  int localId = -1;
  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  String? createdDate;
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
  String? name;
  String? address;
  dynamic numBeds;
  dynamic numBalconies;
  dynamic numBathrooms;
  dynamic image;
  dynamic price;
  List<AdditionsGroupModel>? additionsGroupDTOList;
  List<RoomadditionModel>? roomAdditionDTOList;
  bool? onSale;
  double? evaluation;
  double? cleanEvaluation;
  double? recipeEvaluation;
  double? clientsEvaluation;
  double? teamWorkEvaluation;
  dynamic appId;
  List<ItemImageResponse>? itemImages;
  double? salePrice;
  String? description;
  String? branchName;
  List<RemarkGroupModel>? groupRemarkDTOList;
  int? discountType;
  num? discountRate;
  bool? saleItem;
  int? offerId;
  int? childrenNumber;
  int? adaptNumber;
  num? discountValue;
  dynamic lang;
  dynamic lat;
  bool? fav = false;



  static List<RoomResponse> fromList(dynamic json) => List.from(json.map((e) => RoomResponse.fromJson(e)));



  String toRawJson() => json.encode(toJson());
  // factory ItemResponse.fromJson(dynamic json) {
  //   final product =
  factory RoomResponse.fromJson( dynamic json) {
    final product = RoomResponse(
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
      address: json["address"] == null ? null : json["address"],
      numBeds: json["numBeds"],
      numBalconies: json["numBalconies"],
      numBathrooms: json["numBathrooms"],
      image: json["image"],
      price: json["price"],
      additionsGroupDTOList: json["additionsGroupDTOList"] == null
          ? null
          : List<AdditionsGroupModel>.from(
          json["additionsGroupDTOList"].map((x) =>
              AdditionsGroupModel.fromJson(x))),
      roomAdditionDTOList: json["roomAdditionDTOList"] == null ? null : List<
          RoomadditionModel>.from(json["roomAdditionDTOList"].map((x) =>
          RoomadditionModel.fromJson(x))),
      onSale: json["onSale"] == null ? null : json["onSale"],
      evaluation: json["evaluation"] == null ? null : json["evaluation"],
      cleanEvaluation: json["cleanEvaluation"] == null
          ? null
          : json["cleanEvaluation"],
      recipeEvaluation: json["recipeEvaluation"] == null
          ? null
          : json["recipeEvaluation"],
      clientsEvaluation: json["clientsEvaluation"] == null
          ? null
          : json["clientsEvaluation"],
      teamWorkEvaluation: json["teamWorkEvaluation"] == null
          ? null
          : json["teamWorkEvaluation"],
      appId: json["appId"],
      itemImages: json["itemImages"] == null ? null : List<
          ItemImageResponse>.from(
          json["itemImages"].map((x) => ItemImageResponse.fromJson(x))),
      salePrice: json["salePrice"] == null ? null : json["salePrice"]
          .toDouble(),
      branchName: json["branchName"] == null ? null : json["branchName"],
      description: json["description"] == null ? null : json["description"],
      groupRemarkDTOList: json["groupRemarkDTOList"] == null ? null : List<
          RemarkGroupModel>.from(
          json["groupRemarkDTOList"].map((x) => RemarkGroupModel.fromJson(x))),
      discountType: json["discountType"],
      discountRate: json["discountRate"],
      saleItem: json["saleItem"],
      offerId: json["offerId"],
      discountValue: json["discountValue"],
      lang: json["lang"],
      lat: json["lat"],
      adaptNumber: json["adaptNumber"],
      childrenNumber: json["childrenNumber"],
      fav: false,);
    return product;
  }



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
    "address": address == null ? null : address,
    "numBeds": numBeds,
    "numBalconies": numBalconies,
    "numBathrooms": numBathrooms,
    "image": image,
    "price": price,
    "additionsGroupDTOList": additionsGroupDTOList == null ? null : List<dynamic>.from(additionsGroupDTOList!.map((x) => x.toJson())),
    "roomAdditionDTOList": roomAdditionDTOList == null ? null : List<dynamic>.from(roomAdditionDTOList!.map((x) => x.toJson())),
    "onSale": onSale == null ? null : onSale,
    "evaluation": evaluation == null ? null : evaluation,
    "cleanEvaluation": cleanEvaluation == null ? null : cleanEvaluation,
    "recipeEvaluation": recipeEvaluation == null ? null : recipeEvaluation,
    "clientsEvaluation": clientsEvaluation == null ? null : clientsEvaluation,
    "teamWorkEvaluation": teamWorkEvaluation == null ? null : teamWorkEvaluation,
    "appId": appId,
    // "itemImages": itemImages == null ? null : List<ItemImageResponse>.from(itemImages!.map((x) => x.toJson())),
    "salePrice": salePrice == null ? null : salePrice,
    "description": description == null ? null : description,
    "branchName": branchName == null ? null : branchName,
    "groupRemarkDTOList": groupRemarkDTOList == null ? null : List<dynamic>.from(groupRemarkDTOList!.map((x) => x.toJson())),
    "discountType": discountType,
    "discountRate": discountRate,
    "saleItem": saleItem,
    "offerId": offerId,
    "discountValue": discountValue,
    "lang": lang,
    "lat": lat,
    "adaptNumber": adaptNumber,
    "childrenNumber": childrenNumber,

  };
}
// To parse this JSON data, do
//
//     final roomadditionModel = roomadditionModelFromJson(jsonString);


class RoomadditionModel {
  RoomadditionModel({
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
    this.roomId,
    this.roomName,
    this.additionId,
    this.additionName,
  });

  int ?id;
  bool ?markEdit;
  dynamic? msg;
  dynamic? msgType;
  dynamic? markDisable;
  int ?createdBy;
  String? createdDate;
  int ?index;
  dynamic? companyId;
  dynamic? createdByName;
  dynamic? branchId;
  dynamic? deletedBy;
  dynamic ?deletedDate;
  dynamic ?igmaOwnerId;
  dynamic ?companyCode;
  dynamic ?branchSerial;
  dynamic ?igmaOwnerSerial;
  dynamic ?userCode;
  int ?roomId;
  String? roomName;
  int ?additionId;
  String? additionName;

  factory RoomadditionModel.fromRawJson(String str) => RoomadditionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomadditionModel.fromJson(Map<String, dynamic> json) => RoomadditionModel(
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
    roomId: json["roomId"] == null ? null : json["roomId"],
    roomName: json["roomName"] == null ? null : json["roomName"],
    additionId: json["additionId"] == null ? null : json["additionId"],
    additionName: json["additionName"] == null ? null : json["additionName"],
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
    "roomId": roomId == null ? null : roomId,
    "roomName": roomName == null ? null : roomName,
    "additionId": additionId == null ? null : additionId,
    "additionName": additionName == null ? null : additionName,
  };
}



class RemarkGroupModel {
  RemarkGroupModel({
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
    this.title,
    this.discription,
    this.active,
    this.activeName,
    this.remarkDtoListForGroup,
    this.groupId,
    this.groupName,
  });

  int ?id;
  bool ?markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int ?createdBy;
  dynamic createdDate;
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
  String ?title;
  String ?discription;
  bool ?active;
  String? activeName;
  List<RemarkModel>? remarkDtoListForGroup;
  int ?groupId;
  String? groupName;

  factory RemarkGroupModel.fromRawJson(String str) => RemarkGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemarkGroupModel.fromJson(Map<String, dynamic> json) => RemarkGroupModel(
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
    name: json["name"] == null ? null : json["name"],
    title: json["title"] == null ? null : json["title"],
    discription: json["discription"] == null ? null : json["discription"],
    active: json["active"] == null ? null : json["active"],
    activeName: json["activeName"] == null ? null : json["activeName"],
    remarkDtoListForGroup: json["remarkDTOListForGroup"] == null ? null : List<RemarkModel>.from(json["remarkDTOListForGroup"].map((x) => RemarkModel.fromJson(x))),
    groupId: json["groupId"] == null ? null : json["groupId"],
    groupName: json["groupName"] == null ? null : json["groupName"],

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
    "name": name == null ? null : name,
    "title": title == null ? null : title,
    "discription": discription == null ? null : discription,
    "active": active == null ? null : active,
    "activeName": activeName == null ? null : activeName,
    "remarkDTOListForGroup": remarkDtoListForGroup == null ? null : List<dynamic>.from(remarkDtoListForGroup!.map((x) => x.toJson())),
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,

  };
}
// To parse this JSON data, do
//
//     final remarkForGroupModel = remarkForGroupModelFromJson(jsonString);


class RemarkModel {
  RemarkModel({
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
    this.active,
    this.activeName,
    this.groupId,
    this.groupName,
  });

  int ?id;
  bool ?markEdit;
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
  String? name;
  bool? active;
  String ?activeName;
  int? groupId;
  String ?groupName;

  factory RemarkModel.fromRawJson(String str) => RemarkModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemarkModel.fromJson(Map<String, dynamic> json) => RemarkModel(
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
    name: json["name"] == null ? null : json["name"],
    active: json["active"] == null ? null : json["active"],
    activeName: json["activeName"] == null ? null : json["activeName"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    groupName: json["groupName"] == null ? null : json["groupName"],
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
    "name": name == null ? null : name,
    "active": active == null ? null : active,
    "activeName": activeName == null ? null : activeName,
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,
  };
}


