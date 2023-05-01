import 'dart:convert';

class SpaSearchResponse {
  SpaSearchResponse({
    this.branchList,
    this.citieseList,
    this.roomseList,
    this.holesList,
    this.spaList,
    this.name,
  });

  List<HotelsearchModel>? branchList;
  List<BranchsearchModel>? citieseList;
  List<SpasearchModel>? roomseList;
  List<BranchsearchModel>? holesList;
  List<SpasearchModel>? spaList;
  dynamic  name;

  factory SpaSearchResponse.fromRawJson(String str) => SpaSearchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SpaSearchResponse.fromJson( dynamic json) => SpaSearchResponse(
    branchList: json["branchList"] == null ? null : List<HotelsearchModel>.from(json["branchList"].map((x) => HotelsearchModel.fromJson(x))),
    citieseList: json["citieseList"] == null ? null : List<BranchsearchModel>.from(json["citieseList"].map((x) => BranchsearchModel.fromJson(x))),
    roomseList: json["roomseList"] == null ? null : List<SpasearchModel>.from(json["roomseList"].map((x) => SpasearchModel.fromJson(x))),
    holesList: json["holesList"] == null ? null : List<BranchsearchModel>.from(json["holesList"].map((x) => BranchsearchModel.fromJson(x))),
    spaList: json["spaList"] == null ? null : List<SpasearchModel>.from(json["spaList"].map((x) => SpasearchModel.fromJson(x))),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "branchList": branchList == null ? null : List<HotelsearchModel>.from(branchList!.map((x) => x.toJson())),
    "citieseList": citieseList == null ? null : List<BranchsearchModel>.from(citieseList!.map((x) => x.toJson())),
    "roomseList": roomseList == null ? null : List<SpasearchModel>.from(roomseList!.map((x) => x.toJson())),
    "holesList": holesList == null ? null : List<BranchsearchModel>.from(holesList!.map((x) => x.toJson())),
    "spaList": spaList == null ? null : List<SpasearchModel>.from(spaList!.map((x) => x.toJson())),
    "name": name,
  };
}



class BranchsearchModel {
  BranchsearchModel({
    this.id,
    this.name,
    this.image,

  });

  int ?id;
  String? name;
  String ?image;

  factory BranchsearchModel.fromRawJson(String str) => BranchsearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchsearchModel.fromJson(Map<String, dynamic> json) => BranchsearchModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
  };
}

class HotelsearchModel {
  HotelsearchModel({
    this.id,
    this.name,
    this.image,
    this.imgHole,
    this.imgCar,
    this.imgFood,
    this.imgBar,
    this.imgRoom,
    this.imgSpa,
    this.imgPolman,
    this.imgHouseKeeping,
    this.cityName,
    this.companyId,
    this.cityId,
    this.nameAr,
    this.nameEn,
    this.currencyId,
    this.currencyName,
    this.currencySubName
  });

  int ?id;
  String? name;
  String ?image;
  String ?imgHole;
  String ?imgCar;
  String ?imgFood;
  String ?imgBar;
  String ?imgRoom;
  String ?imgSpa;
  String ?imgPolman;
  String ?imgHouseKeeping;
  String ?cityName;
  int? cityId ;
  String? nameAr ;
  String? nameEn ;
  String? currencySubName  ;
  String? currencyName  ;
  int? companyId ;
  int? currencyId;

  String toRawJson() => json.encode(toJson());

  static List<HotelsearchModel> fromList(dynamic json) => List.from(json.map((e)=> HotelsearchModel.fromJson(e)));
  factory HotelsearchModel.fromJson(Map<String, dynamic> json) => HotelsearchModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    imgHole: json["imgHole"] == null ? null : json["imgHole"],
    imgCar: json["imgCar"] == null ? null : json["imgCar"],
    imgFood: json["imgFood"] == null ? null : json["imgFood"],
    imgBar: json["imgBar"] == null ? null : json["imgBar"],
    imgRoom: json["imgRoom"] == null ? null : json["imgRoom"],
    imgSpa: json["imgSpa"] == null ? null : json["imgSpa"],
    imgPolman: json["imgPolman"] == null ? null : json["imgPolman"],
    imgHouseKeeping: json["imgHouseKeeping"] == null ? null : json["imgHouseKeeping"],
    cityName: json["cityName"] == null ? null : json["cityName"],
    cityId: json["cityId"] == null ? null : json["cityId"],
    nameAr: json["nameAr"] == null ? null : json["nameAr"],
    nameEn: json["nameEn"] == null ? null : json["nameEn"],
    companyId: json["companyId"] == null ? null : json["companyId"],
        currencySubName: json["currencySubName"] == null ? null : json["currencySubName"],
    currencyName: json["currencyName"] == null ? null : json["currencyName"],
    currencyId: json["currencyId"] == null ? null : json["currencyId"],

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "imgHole": imgHole == null ? null : imgHole,
    "imgCar": imgCar == null ? null : imgCar,
    "imgFood": imgFood == null ? null : imgFood,
    "imgBar": imgBar == null ? null : imgBar,
    "imgRoom": imgRoom == null ? null : imgRoom,
    "imgSpa": imgSpa == null ? null : imgSpa,
    "imgPolman": imgPolman == null ? null : imgPolman,
    "imgHouseKeeping": imgHouseKeeping == null ? null : imgHouseKeeping,
    "cityName": cityName == null ? null : cityName,
    "cityId": cityId == null ? null : cityId,
    "nameAr": nameAr == null ? null : nameAr,
    "nameEn": nameEn == null ? null : nameEn,
    "companyId": companyId == null ? null : companyId,
    "currencySubName": currencySubName == null ? null : currencySubName,
    "currencyName": currencyName == null ? null : currencyName,
    "currencyId": currencyId == null ? null : currencyId,

  };
}
class SpasearchModel {
  SpasearchModel({
    this.id,
    this.name,
    this.image,
    this.hotelName,

  });

  int ?id;
  String? name;
  String ?image;
  String ?hotelName;


  String toRawJson() => json.encode(toJson());

  factory SpasearchModel.fromJson(Map<String, dynamic> json) => SpasearchModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    hotelName: json["hotelName"] == null ? null : json["hotelName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "hotelName": hotelName == null ? null : hotelName,
  };
}