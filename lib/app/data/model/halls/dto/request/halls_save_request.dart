
import 'dart:convert';

import 'package:easy_hotel/app/data/model/halls/dto/response/halls_periods_response.dart';
import 'package:easy_hotel/app/data/model/halls/dto/response/halls_response.dart';
import 'package:get/get.dart';



class HallsSaveRequest {
  HallsSaveRequest({
    this.hallId,
    this.branchId,
    this.createdBy,
    this.companyId,
    this.addtionsDTOList,
    this.customerId,
    this.currencySerial,
    required this.holePeriodIdList
  });

  int? hallId;
  int? branchId;
  int?createdBy;
  int?companyId;
  List<AddtionsModel>? addtionsDTOList ;
  int? customerId ;
  int? currencySerial ;
  List<HallsPeriodsResponse>? holePeriodIdList ;

  factory HallsSaveRequest.fromJson(Map<String, dynamic> json) => HallsSaveRequest(
      hallId: json["hallId"] == null ? null : json["hallId"],
      customerId: json["customerId"] == null ? null : json["customerId"],
      currencySerial: json["currencySerial"] == null ? null : json["currencySerial"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      holePeriodIdList: json["branchId"] == null ? null : HallsPeriodsResponse.fromList(json["holePeriodIdList"])
      // addtionsDTOList : json["addtionsDTOList"] == null ? null : List<AddtionsModel>.from(json["addtionsDTOList"].map((e) => addtionsDTOList.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "hallId": hallId == null ? null : hallId,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "currencySerial": currencySerial == null ? null : currencySerial,
    "branchId": branchId == null ? null : branchId,
    "addtionsDTOList" : addtionsDTOList == null ? null : List<dynamic>.from(addtionsDTOList!.map((x) => x.toJson())),
    "holePeriodIdList" : holePeriodIdList == null ? null : List<dynamic>.from(holePeriodIdList!.map((x) => x.toJson()))
  };
}

