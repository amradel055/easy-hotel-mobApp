// To parse this JSON data, do
//
//     final salesDetailsSpa = salesDetailsSpaFromJson(jsonString);

import 'dart:convert';

import 'package:easy_hotel/app/data/model/housekeeping/dto/response/housekeeping_detail_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';




class HousekeepingSaveRequest {
  HousekeepingSaveRequest({
    // this.serviceTypeId,
    this.branchId,
    this.createdBy,
    this.companyId,
    this.houseKeepingDTOList,
    this.customerId,
    this.dueDate,
    this.dueTime,
    this.remark,
    this.phone,
    this.email,
    this.name,
  });

  // int? serviceTypeId;
  int? branchId;
  int?createdBy;
  int?companyId;
  List<HouseKeepingDetailResponse>? houseKeepingDTOList ;
  int? customerId ;
  DateTime? dueDate ;
  DateTime? dueTime ;
  String? remark ;
  String ?phone;
  String?email;
  String?name;

  factory HousekeepingSaveRequest.fromJson( dynamic json) => HousekeepingSaveRequest(
      // serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
      customerId: json["customerId"] == null ? null : json["customerId"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      remark: json["remark"] == null ? null : json["remark"],
    houseKeepingDTOList: json["houseKeepingDTOList"] == null ? null : List<HouseKeepingDetailResponse>.from(json["houseKeepingDTOList"].map((x) => x)),

    // salesDetailHouseKeepingDTOList : json["salesDetailHouseKeepingDTOList"] == null ? null : List<int>.from(json["salesDetailHouseKeepingDTOList"].map((e) => SalesDetailsSpaItem.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    // "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "remark": remark == null ? null : remark,
    "dueTime": dueTime == null ? null : dueTime?.toIso8601String(),
    "dueDate": dueDate == null ? null : dueDate?.toIso8601String(),
    "houseKeepingDTOList" : houseKeepingDTOList == null ? null : List<dynamic>.from(houseKeepingDTOList!.map((x) => x.toJson())),


    // "salesDetailHouseKeepingDTOList": salesDetailHouseKeepingDTOList == null ? null : List<dynamic>.from(salesDetailHouseKeepingDTOList!.map((x) => x)),
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
  };
}
