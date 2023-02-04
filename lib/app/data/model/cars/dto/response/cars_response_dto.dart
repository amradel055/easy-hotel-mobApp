// To parse this JSON data, do
//
//     final carsResponse = carsResponseFromJson(jsonString);

import 'dart:convert';

CarsResponse carsResponseFromJson(String str) => CarsResponse.fromJson(json.decode(str));

String carsResponseToJson(CarsResponse data) => json.encode(data.toJson());

class CarsResponse {
  CarsResponse({
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
    this.describtion,
    this.groupId,
    this.groupName,
    this.phone,
    this.serial,
    this.type,
    this.image,
    this.seatsNumber,
    this.currencySerial,
    this.discountType,
    this.saleItem,
    this.offerId,
    this.itemImages,
    this.addtionsDtoList,
    this.additionsGroupDtoList,
    this.reviewStars,
    this.carImagesList,
    this.priceFrom,
    this.priceTo,
    this.nameEn,
    this.active,
    this.activeName,
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  String? createdDate;
  int? index;
  int? companyId;
  dynamic createdByName;
  int? branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  String? name;
  String? describtion;
  int? groupId;
  String? groupName;
  String? phone;
  String? serial;
  String? type;
  dynamic image;
  int? seatsNumber;
  dynamic currencySerial;
  int? discountType;
  bool? saleItem;
  dynamic offerId;
  List<dynamic>? itemImages;
  List<AddtionsDtoList>? addtionsDtoList;
  List<AdditionsGroupDtoList>? additionsGroupDtoList;
  double? reviewStars;
  List<dynamic>? carImagesList;
  dynamic priceFrom;
  dynamic priceTo;
  dynamic nameEn;
  bool? active;
  String? activeName;

  static List<CarsResponse> fromList(dynamic json) => List.from(json.map((e) => CarsResponse.fromJson(e)));


  factory CarsResponse.fromJson(Map<String, dynamic> json) => CarsResponse(
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
    describtion: json["describtion"],
    groupId: json["groupId"],
    groupName: json["groupName"],
    phone: json["phone"],
    serial: json["serial"],
    type: json["type"],
    image: json["image"],
    seatsNumber: json["seatsNumber"],
    currencySerial: json["currencySerial"],
    discountType: json["discountType"],
    saleItem: json["saleItem"],
    offerId: json["offerId"],
    itemImages: json["itemImages"] == null ? [] : List<dynamic>.from(json["itemImages"]!.map((x) => x)),
    addtionsDtoList: json["addtionsDTOList"] == null ? [] : List<AddtionsDtoList>.from(json["addtionsDTOList"]!.map((x) => AddtionsDtoList.fromJson(x))),
    additionsGroupDtoList: json["additionsGroupDTOList"] == null ? [] : List<AdditionsGroupDtoList>.from(json["additionsGroupDTOList"]!.map((x) => AdditionsGroupDtoList.fromJson(x))),
    reviewStars: json["reviewStars"]?.toDouble(),
    carImagesList: json["carImagesList"] == null ? [] : List<dynamic>.from(json["carImagesList"]!.map((x) => x)),
    priceFrom: json["priceFrom"],
    priceTo: json["priceTo"],
    nameEn: json["nameEn"],
    active: json["active"],
    activeName: json["activeName"],
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
    "describtion": describtion,
    "groupId": groupId,
    "groupName": groupName,
    "phone": phone,
    "serial": serial,
    "type": type,
    "image": image,
    "seatsNumber": seatsNumber,
    "currencySerial": currencySerial,
    "discountType": discountType,
    "saleItem": saleItem,
    "offerId": offerId,
    "itemImages": itemImages == null ? [] : List<dynamic>.from(itemImages!.map((x) => x)),
    "addtionsDTOList": addtionsDtoList == null ? [] : List<dynamic>.from(addtionsDtoList!.map((x) => x.toJson())),
    "additionsGroupDTOList": additionsGroupDtoList == null ? [] : List<dynamic>.from(additionsGroupDtoList!.map((x) => x.toJson())),
    "reviewStars": reviewStars,
    "carImagesList": carImagesList == null ? [] : List<dynamic>.from(carImagesList!.map((x) => x)),
    "priceFrom": priceFrom,
    "priceTo": priceTo,
    "nameEn": nameEn,
    "active": active,
    "activeName": activeName,
  };
}

class AdditionsGroupDtoList {
  AdditionsGroupDtoList({
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
    this.serial,
    this.image,
    this.additionsGroupHoleImagesDtoList,
    this.holeGroupImahgesList,
    this.additionsGroupRoomImagesDtoList,
    this.additionsGroupRoomImagesList,
    this.carGroupAddImagesList,
    this.nameEn,
    this.active,
    this.activeName,
  });

  dynamic id;
  bool? markEdit;
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
  List<AddtionsDtoList>? addtionsDtoList;
  dynamic appId;
  dynamic serial;
  dynamic image;
  List<dynamic>? additionsGroupHoleImagesDtoList;
  List<dynamic>? holeGroupImahgesList;
  dynamic additionsGroupRoomImagesDtoList;
  dynamic additionsGroupRoomImagesList;
  List<dynamic>? carGroupAddImagesList;
  dynamic nameEn;
  dynamic active;
  dynamic activeName;

  factory AdditionsGroupDtoList.fromJson(Map<String, dynamic> json) => AdditionsGroupDtoList(
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
    addtionsDtoList: json["addtionsDTOList"] == null ? [] : List<AddtionsDtoList>.from(json["addtionsDTOList"]!.map((x) => AddtionsDtoList.fromJson(x))),
    appId: json["appId"],
    serial: json["serial"],
    image: json["image"],
    additionsGroupHoleImagesDtoList: json["additionsGroupHoleImagesDTOList"] == null ? [] : List<dynamic>.from(json["additionsGroupHoleImagesDTOList"]!.map((x) => x)),
    holeGroupImahgesList: json["holeGroupImahgesList"] == null ? [] : List<dynamic>.from(json["holeGroupImahgesList"]!.map((x) => x)),
    additionsGroupRoomImagesDtoList: json["additionsGroupRoomImagesDTOList"],
    additionsGroupRoomImagesList: json["additionsGroupRoomImagesList"],
    carGroupAddImagesList: json["carGroupAddImagesList"] == null ? [] : List<dynamic>.from(json["carGroupAddImagesList"]!.map((x) => x)),
    nameEn: json["nameEn"],
    active: json["active"],
    activeName: json["activeName"],
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
    "addtionsDTOList": addtionsDtoList == null ? [] : List<dynamic>.from(addtionsDtoList!.map((x) => x.toJson())),
    "appId": appId,
    "serial": serial,
    "image": image,
    "additionsGroupHoleImagesDTOList": additionsGroupHoleImagesDtoList == null ? [] : List<dynamic>.from(additionsGroupHoleImagesDtoList!.map((x) => x)),
    "holeGroupImahgesList": holeGroupImahgesList == null ? [] : List<dynamic>.from(holeGroupImahgesList!.map((x) => x)),
    "additionsGroupRoomImagesDTOList": additionsGroupRoomImagesDtoList,
    "additionsGroupRoomImagesList": additionsGroupRoomImagesList,
    "carGroupAddImagesList": carGroupAddImagesList == null ? [] : List<dynamic>.from(carGroupAddImagesList!.map((x) => x)),
    "nameEn": nameEn,
    "active": active,
    "activeName": activeName,
  };
}

class AddtionsDtoList {
  AddtionsDtoList({
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
    this.image,
    this.price,
    this.serial,
    this.appId,
    this.appName,
    this.itemId,
    this.hallId,
    this.discount,
    this.discountType,
    this.salePrice,
    this.additionsHoleImagesDtoList,
    this.additionsHoleImagesList,
    this.additionsRoomImagesDtoList,
    this.additionsRoomImagesList,
    this.activeName,
    this.carAdditionImagesList,
    this.additionsGroupId,
    this.additionsGroupName,
    this.mainAdditionId,
    this.nameEn,
    this.active,
    this.foodAdditionImagesList,
  });

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
  dynamic image;
  dynamic price;
  int? serial;
  int? appId;
  String? appName;
  dynamic itemId;
  dynamic hallId;
  int? discount;
  dynamic discountType;
  int? salePrice;
  List<dynamic>? additionsHoleImagesDtoList;
  List<dynamic>? additionsHoleImagesList;
  List<dynamic>? additionsRoomImagesDtoList;
  List<dynamic>? additionsRoomImagesList;
  String? activeName;
  List<dynamic>? carAdditionImagesList;
  int? additionsGroupId;
  String? additionsGroupName;
  dynamic mainAdditionId;
  dynamic nameEn;
  bool? active;
  List<dynamic>? foodAdditionImagesList;

  factory AddtionsDtoList.fromJson(Map<String, dynamic> json) => AddtionsDtoList(
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
    image: json["image"],
    price: json["price"],
    serial: json["serial"],
    appId: json["appId"],
    appName: json["appName"],
    itemId: json["itemId"],
    hallId: json["hallId"],
    discount: json["discount"],
    discountType: json["discountType"],
    salePrice: json["salePrice"],
    additionsHoleImagesDtoList: json["additionsHoleImagesDTOList"] == null ? [] : List<dynamic>.from(json["additionsHoleImagesDTOList"]!.map((x) => x)),
    additionsHoleImagesList: json["additionsHoleImagesList"] == null ? [] : List<dynamic>.from(json["additionsHoleImagesList"]!.map((x) => x)),
    additionsRoomImagesDtoList: json["additionsRoomImagesDTOList"] == null ? [] : List<dynamic>.from(json["additionsRoomImagesDTOList"]!.map((x) => x)),
    additionsRoomImagesList: json["additionsRoomImagesList"] == null ? [] : List<dynamic>.from(json["additionsRoomImagesList"]!.map((x) => x)),
    activeName: json["activeName"],
    carAdditionImagesList: json["carAdditionImagesList"] == null ? [] : List<dynamic>.from(json["carAdditionImagesList"]!.map((x) => x)),
    additionsGroupId: json["additionsGroupId"],
    additionsGroupName: json["additionsGroupName"],
    mainAdditionId: json["mainAdditionId"],
    nameEn: json["nameEn"],
    active: json["active"],
    foodAdditionImagesList: json["foodAdditionImagesList"] == null ? [] : List<dynamic>.from(json["foodAdditionImagesList"]!.map((x) => x)),
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
    "image": image,
    "price": price,
    "serial": serial,
    "appId": appId,
    "appName": appName,
    "itemId": itemId,
    "hallId": hallId,
    "discount": discount,
    "discountType": discountType,
    "salePrice": salePrice,
    "additionsHoleImagesDTOList": additionsHoleImagesDtoList == null ? [] : List<dynamic>.from(additionsHoleImagesDtoList!.map((x) => x)),
    "additionsHoleImagesList": additionsHoleImagesList == null ? [] : List<dynamic>.from(additionsHoleImagesList!.map((x) => x)),
    "additionsRoomImagesDTOList": additionsRoomImagesDtoList == null ? [] : List<dynamic>.from(additionsRoomImagesDtoList!.map((x) => x)),
    "additionsRoomImagesList": additionsRoomImagesList == null ? [] : List<dynamic>.from(additionsRoomImagesList!.map((x) => x)),
    "activeName": activeName,
    "carAdditionImagesList": carAdditionImagesList == null ? [] : List<dynamic>.from(carAdditionImagesList!.map((x) => x)),
    "additionsGroupId": additionsGroupId,
    "additionsGroupName": additionsGroupName,
    "mainAdditionId": mainAdditionId,
    "nameEn": nameEn,
    "active": active,
    "foodAdditionImagesList": foodAdditionImagesList == null ? [] : List<dynamic>.from(foodAdditionImagesList!.map((x) => x)),
  };
}
