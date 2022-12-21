class SpaOfferResponse {
  SpaOfferResponse({
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
    this.lang,
    this.lat,
    this.address,
    this.hotelName,
    this.cityName,
    this.spaId,
   this.offerValue
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
  int ?spaId;
  String? groupName;
  dynamic image;
  dynamic lang;
  dynamic lat;
  // List<OfferResponse> ? offersDTOList;
  String? address;
  double? offerValue;

  static List<SpaOfferResponse> fromList(dynamic json) => List.from(json.map((e) => SpaOfferResponse.fromJson(e)));

  factory SpaOfferResponse.fromJson( dynamic json) => SpaOfferResponse(
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
    spaId: json["spaId"] == null ? null : json["spaId"],
    groupName: json["groupName"] == null ? null : json["groupName"],
    image: json["image"],
    lang: json["lang"],
    lat: json["lat"],
    // offersDTOList: json["offersDTOList"] == null ? null : List<OfferResponse>.from(json["offersDTOList"].map((x) => OfferResponse.fromJson(x) )),
    address: json["address"] == null ? null : json["address"],
    offerValue: json["offerValue"] == null ? null : json["offerValue"],
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
    "spaId": spaId == null ? null : spaId,
    "groupName": groupName == null ? null : groupName,
    "image": image,
    "lang": lang,
    "lat": lat,
    // "offersDTOList": offersDTOList == null ? null : List<OfferResponse>.from(offersDTOList!.map((x) => x)),
    "address": address == null ? null : address,
    "offerValue": offerValue == null ? null : offerValue,
  };
}
