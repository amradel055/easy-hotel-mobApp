import 'package:meta/meta.dart';
import 'dart:convert';

class HotelDetail {
  int id;
  String nameAr;
  String nameEn;
  dynamic terms;
  dynamic termsEn;
  int companyId;
  dynamic cityId;
  String cityName;
  dynamic image;
  dynamic imgHole;
  dynamic imgCar;
  dynamic imgFood;
  dynamic imgBar;
  dynamic imgRoom;
  dynamic imgSpa;
  dynamic imgPolman;
  dynamic imgHouseKeeping;
  double lat;
  double lang;
  int starNum;
  String currencyName;
  String currencySubName;
  int currencyId;
  dynamic description;
  List<Service> services;
  List<String> images;

  HotelDetail({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.terms,
    required this.termsEn,
    required this.companyId,
    required this.cityId,
    required this.cityName,
    required this.image,
    required this.imgHole,
    required this.imgCar,
    required this.imgFood,
    required this.imgBar,
    required this.imgRoom,
    required this.imgSpa,
    required this.imgPolman,
    required this.imgHouseKeeping,
    required this.lat,
    required this.lang,
    required this.starNum,
    required this.currencyName,
    required this.currencySubName,
    required this.currencyId,
    required this.description,
    required this.services,
    required this.images,
  });



  factory HotelDetail.fromJson( dynamic json)  => HotelDetail(
    id: json["id"],
    nameAr: json["nameAr"],
    nameEn: json["nameEn"],
    terms: json["terms"],
    termsEn: json["termsEn"],
    companyId: json["companyId"],
    cityId: json["cityId"],
    cityName: json["cityName"],
    image: json["image"],
    imgHole: json["imgHole"],
    imgCar: json["imgCar"],
    imgFood: json["imgFood"],
    imgBar: json["imgBar"],
    imgRoom: json["imgRoom"],
    imgSpa: json["imgSpa"],
    imgPolman: json["imgPolman"],
    imgHouseKeeping: json["imgHouseKeeping"],
    lat: json["lat"]?.toDouble(),
    lang: json["lang"]?.toDouble(),
    starNum: json["starNum"],
    currencyName: json["currencyName"],
    currencySubName: json["currencySubName"],
    currencyId: json["currencyId"],
    description: json["description"],
    services: List<Service>.from(json["services"].map((x) => Service.fromMap(x))),
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameAr": nameAr,
    "nameEn": nameEn,
    "terms": terms,
    "termsEn": termsEn,
    "companyId": companyId,
    "cityId": cityId,
    "cityName": cityName,
    "image": image,
    "imgHole": imgHole,
    "imgCar": imgCar,
    "imgFood": imgFood,
    "imgBar": imgBar,
    "imgRoom": imgRoom,
    "imgSpa": imgSpa,
    "imgPolman": imgPolman,
    "imgHouseKeeping": imgHouseKeeping,
    "lat": lat,
    "lang": lang,
    "starNum": starNum,
    "currencyName": currencyName,
    "currencySubName": currencySubName,
    "currencyId": currencyId,
    "description": description,
    "services": List<dynamic>.from(services.map((x) => x.toMap())),
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

class Service {
  dynamic id;
  bool markEdit;
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
  String title;
  dynamic text;

  Service({
    required this.id,
    required this.markEdit,
    required this.msg,
    required this.msgType,
    required this.markDisable,
    required this.createdBy,
    required this.createdDate,
    required this.index,
    required this.companyId,
    required this.createdByName,
    required this.branchId,
    required this.deletedBy,
    required this.deletedDate,
    required this.igmaOwnerId,
    required this.companyCode,
    required this.branchSerial,
    required this.igmaOwnerSerial,
    required this.userCode,
    required this.title,
    required this.text,
  });

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  static List<Service> fromList(dynamic json) => List.from(json.map((e) => Service.fromJson(e)));

  factory Service.fromMap(Map<String, dynamic> json) => Service(
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
    title: json["title"],
    text: json["text"],
  );

  Map<String, dynamic> toMap() => {
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
    "title": title,
    "text": text,
  };
}
