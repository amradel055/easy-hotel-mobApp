// To parse this JSON data, do
//
//     final salesDetailsSpa = salesDetailsSpaFromJson(jsonString);

import 'dart:convert';

import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';




class PolmanSaveRequest {
  PolmanSaveRequest({
    // this.serviceTypeId,
    this.branchId,
    this.createdBy,
    this.companyId,
    this.customerId,
    this.dueDate,
    this.dueTime,
    this.remark,
    this.email,
    this.name,
    this.phone
  });

  // int? serviceTypeId;
  int? branchId;
  int?createdBy;
  int?companyId;
  int? customerId ;
  DateTime? dueDate ;
  DateTime? dueTime ;
  String? remark ;
  String ?phone;
  String?email;
  String?name;

  factory PolmanSaveRequest.fromJson( dynamic json) => PolmanSaveRequest(
      // serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
      customerId: json["customerId"] == null ? null : json["customerId"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
    remark: json["remark"] == null ? null : json["remark"],
  );

  Map<String, dynamic> toJson() => {
    // "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "remark": remark == null ? null : remark,
    "dueDate": dueDate == null ? null : dueDate?.toIso8601String(),
    "dueTime": dueTime == null ? null : dueTime?.toIso8601String(),
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
  };
}
