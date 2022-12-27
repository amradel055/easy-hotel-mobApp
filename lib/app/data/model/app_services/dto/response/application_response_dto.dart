// To parse this JSON data, do
//
//     final applicationResponse = applicationResponseFromJson(jsonString);

import 'dart:convert';

ApplicationResponse applicationResponseFromJson(String str) => ApplicationResponse.fromJson(json.decode(str));

String applicationResponseToJson(ApplicationResponse data) => json.encode(data.toJson());

class ApplicationResponse {
  ApplicationResponse({
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
    this.applications,
    this.applicationName,
    this.imgOut,
    this.imgIn,
  });

  dynamic id;
  bool ?markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  dynamic createdBy;
  dynamic createdDate;
  dynamic index;
  dynamic companyId;
  dynamic createdByName;
  int ?branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic userCode;
  int ?applications;
  String? applicationName;
  dynamic imgOut;
  dynamic imgIn;
  static List<ApplicationResponse> fromList(dynamic json) => List.from(json.map((e)=> ApplicationResponse.fromJson(e)));

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) => ApplicationResponse(
    id: json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    index: json["index"],
    companyId: json["companyId"],
    createdByName: json["createdByName"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    companyCode: json["companyCode"],
    branchSerial: json["branchSerial"],
    igmaOwnerSerial: json["igmaOwnerSerial"],
    userCode: json["userCode"],
    applications: json["applications"] == null ? null : json["applications"],
    applicationName: json["applicationName"] == null ? null : json["applicationName"],
    imgOut: json["imgOut"],
    imgIn: json["imgIn"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "index": index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId == null ? null : branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "userCode": userCode,
    "applications": applications == null ? null : applications,
    "applicationName": applicationName == null ? null : applicationName,
    "imgOut": imgOut,
    "imgIn": imgIn,
  };
}
