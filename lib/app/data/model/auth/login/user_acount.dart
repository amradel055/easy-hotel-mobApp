import 'dart:convert';
// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);


UserAccount customerFromJson(String str) => UserAccount.fromJson(json.decode(str));

String customerToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
  UserAccount({
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
    this.hotelBoking
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
  int? hotelBoking;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
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
    hotelBoking: json["hotelBoking"] == null ? null : json["hotelBoking"],


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
    "hotelBoking": hotelBoking == null ? null : hotelBoking,

  };
}

// class UserAccount {
//   UserAccount({
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.name,
//     required this.phoneNumber,
//     required this.appId,
//     required this.firebaseId,
//     required this.preferredLanguage,
//     required this.preferredTheme,
//   });
//
//   final String id;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String name;
//   final String phoneNumber;
//   final String? appId;
//   final String? firebaseId;
//   final String preferredLanguage;
//   final String preferredTheme;
//
//   factory UserAccount.fromRawJson(String str) => UserAccount.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//
//   factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
//     id: json["id"],
//     createdAt: json["createdAt"] == null?null:DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null?null:DateTime.parse(json["updatedAt"]),
//     name: json["name"],
//     phoneNumber: json["phoneNumber"],
//     appId: json["appId"],
//     firebaseId: json["firebaseId"],
//     preferredLanguage: json["preferredLanguage"],
//     preferredTheme: json["preferredTheme"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "name": name,
//     "phoneNumber": phoneNumber,
//     "appId": appId,
//     "firebaseId": firebaseId,
//     "preferredLanguage": preferredLanguage,
//     "preferredTheme": preferredTheme,
//   };
// }
