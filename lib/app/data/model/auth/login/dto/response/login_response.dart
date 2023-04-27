import 'package:easy_hotel/app/data/model/base_request.dart';

// class LoginResponse{
//   LoginResponse({
//     // required this.accessToken,
//     // required this.tokenType,
//     // required this.expiresIn,
//     // required this.user,
//     required this.success,
//     required this.data,
//     required this.msg,
//     required this.code,
//     required this.pagination,
//   });
//
//   // final String accessToken;
//   // final String tokenType;
//   // final int? expiresIn;
//   // final User user;
//   final bool success;
//   final dynamic data;
//   final String code;
//   final String msg;
//   final dynamic pagination;
//
//
//   factory LoginResponse.fromJson(json) => LoginResponse(
//     // accessToken: json["access_token"],
//     // tokenType: json["token_type"],
//     // expiresIn: json["expires_in"],
//     // user: User.fromJson(json["user"]),
//     success: json["success"],
//     data: json["data"],
//     msg: json["msg"],
//     code: json["code"],
//     pagination: json["pagination"],
//   );
//
//   @override
//   Map<String, dynamic> toJson() => {
//     // "access_token": accessToken,
//     // "token_type": tokenType,
//     // "expires_in": expiresIn,
//     // "user": user.toJson(),
//     "success": success,
//     "data": data,
//     "msg": msg,
//     "code": code,
//     "pagination": pagination,
//   };
// }

// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);



class LoginResponse {
  LoginResponse({
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
    this.code,
    this.name,
    this.address,
    this.telephone,
    this.fax,
    this.mobile,
    this.password,
    this.personResponsible,
    this.phone,
    this.email,
    this.type,
    this.postBox,
    this.discount,
    this.openBalanceDebit,
    this.openBalanceCredit,
    this.balanceLimit,
    this.remark,
    this.active,
    this.zip,
    this.contactPerson,
    this.phone2,
    this.openBalanceDate,
    this.companyName,
    this.nationId,
    this.accountBankNumber,
    this.sponsorName1,
    this.sponsorPhone1,
    this.sponsorName2,
    this.sponsorPhone2,
    this.birthdate,
    this.countryId,
    this.currencyId,
    this.regionId,
    this.workTypeId,
    this.parent,
    this.supplierType,
    this.contractorType,
    this.globalFilter,
    this.hotelBooking,
    this.cityId,
    this.cityName,
    this.currencyName,
    this.languageName,
    this.image,
  });

  int? id;
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
  dynamic code;
  String? name;
  String? address;
  dynamic telephone;
  dynamic fax;
  dynamic mobile;
  dynamic password;
  dynamic personResponsible;
  String? phone;
  String? email;
  dynamic type;
  dynamic postBox;
  dynamic discount;
  dynamic openBalanceDebit;
  dynamic openBalanceCredit;
  dynamic balanceLimit;
  dynamic remark;
  dynamic active;
  dynamic zip;
  dynamic contactPerson;
  dynamic phone2;
  dynamic openBalanceDate;
  dynamic companyName;
  dynamic nationId;
  dynamic accountBankNumber;
  dynamic sponsorName1;
  dynamic sponsorPhone1;
  dynamic sponsorName2;
  dynamic sponsorPhone2;
  dynamic birthdate;
  dynamic countryId;
  dynamic currencyId;
  dynamic regionId;
  dynamic workTypeId;
  dynamic parent;
  dynamic supplierType;
  dynamic contractorType;
  dynamic globalFilter;
  int? hotelBooking;
  int? cityId;
  String ? cityName;
  String ? languageName;
  String ? currencyName;
  int? image;


  factory LoginResponse.fromJson( dynamic json) => LoginResponse(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
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
    code: json["code"],
    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    telephone: json["telephone"],
    fax: json["fax"],
    mobile: json["mobile"],
    password: json["password"],
    personResponsible: json["personResponsible"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    type: json["type"],
    postBox: json["postBox"],
    discount: json["discount"] == null ? null : json["discount"],
    openBalanceDebit: json["openBalanceDebit"] == null ? null :  double.parse(json["openBalanceDebit"].toString())  ,
    openBalanceCredit: json["openBalanceCredit"] == null ? null : double.parse(json["openBalanceCredit"].toString()),
    balanceLimit: json["balanceLimit"],
    remark: json["remark"],
    active: json["active"],
    zip: json["zip"],
    contactPerson: json["contactPerson"],
    phone2: json["phone2"],
    openBalanceDate: json["openBalanceDate"],
    companyName: json["companyName"],
    nationId: json["nationId"],
    accountBankNumber: json["accountBankNumber"],
    sponsorName1: json["sponsorName1"],
    sponsorPhone1: json["sponsorPhone1"],
    sponsorName2: json["sponsorName2"],
    sponsorPhone2: json["sponsorPhone2"],
    birthdate: json["birthdate"],
    countryId: json["countryId"],
    currencyId: json["currencyId"],
    regionId: json["regionId"],
    workTypeId: json["workTypeId"],
    parent: json["parent"],
    supplierType: json["supplierType"],
    contractorType: json["contractorType"],
    globalFilter: json["globalFilter"],
    hotelBooking: json["hotelBooking"],
    cityId: json["cityId"],
    cityName: json["cityName"] == null ? null : json["cityName"],
    currencyName: json["currencyName"] == null ? null : json["currencyName"],
    languageName: json["languageName"] == null ? null : json["languageName"],
    image: json["image"] == null ? null : json["image"],


  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
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
    "code": code,
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "telephone": telephone,
    "fax": fax,
    "mobile": mobile,
    "password": password,
    "personResponsible": personResponsible,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "type": type,
    "postBox": postBox,
    "discount": discount == null ? null : discount,
    "openBalanceDebit": openBalanceDebit == null ? null : openBalanceDebit,
    "openBalanceCredit": openBalanceCredit == null ? null : openBalanceCredit,
    "balanceLimit": balanceLimit,
    "remark": remark,
    "active": active,
    "zip": zip,
    "contactPerson": contactPerson,
    "phone2": phone2,
    "openBalanceDate": openBalanceDate,
    "companyName": companyName,
    "nationId": nationId,
    "accountBankNumber": accountBankNumber,
    "sponsorName1": sponsorName1,
    "sponsorPhone1": sponsorPhone1,
    "sponsorName2": sponsorName2,
    "sponsorPhone2": sponsorPhone2,
    "birthdate": birthdate,
    "countryId": countryId,
    "currencyId": currencyId,
    "regionId": regionId,
    "workTypeId": workTypeId,
    "parent": parent,
    "supplierType": supplierType,
    "contractorType": contractorType,
    "globalFilter": globalFilter,
    "hotelBooking": hotelBooking,
    "cityId": cityId == null ? null : cityId,
    "cityName": cityName == null ? null : cityName,
    "languageName": languageName == null ? null : languageName,
    "currencyName": currencyName == null ? null : currencyName,
    "image": image == null ? null : image,

  };
}
