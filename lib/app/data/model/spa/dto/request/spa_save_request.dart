
import 'dart:convert';

import 'package:get/get.dart';

SpaSaveRequest salesDetailsSpaFromJson(String str) => SpaSaveRequest.fromJson(json.decode(str));

String salesDetailsSpaToJson(SpaSaveRequest data) => json.encode(data.toJson());

class SpaSaveRequest {
  SpaSaveRequest({
    this.spaId,
    this.branchId,
    this.createdBy,
    this.companyId,
    this.salesDetailSpaItemDTOList,
    this.customerId,
    this.spaItemDTOList
  });

  int? spaId;
  int? branchId;
  int?createdBy;
  int?companyId;
  List<SalesDetailsSpaItem>? salesDetailSpaItemDTOList ;
  int? customerId ;
  List<int>?spaItemDTOList;

  factory SpaSaveRequest.fromJson(Map<String, dynamic> json) => SpaSaveRequest(
      spaId: json["spaId"] == null ? null : json["spaId"],
      customerId: json["customerId"] == null ? null : json["customerId"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      spaItemDTOList: json["spaItemDTOList"] == null ? null : List<int>.from(json["spaItemDTOList"].map((x) => x)),
      salesDetailSpaItemDTOList : json["salesDetailSpaItemDTOList"] == null ? null : List<SalesDetailsSpaItem>.from(json["salesDetailSpaItemDTOList"].map((e) => SalesDetailsSpaItem.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "spaId": spaId == null ? null : spaId,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "spaItemDTOList": spaItemDTOList == null ? null : List<dynamic>.from(spaItemDTOList!.map((x) => x)),
    "salesDetailSpaItemDTOList" : salesDetailSpaItemDTOList == null ? null : List<dynamic>.from(salesDetailSpaItemDTOList!.map((x) => x.toJson()))
  };
}

class SalesDetailsSpaItem {
  SalesDetailsSpaItem({
    this.spaItemId,
    this.salesDetailSpaId,
    this.price,
    this.branchId,
  });

  int? spaItemId;
  int? salesDetailSpaId;
  double? price;
  int? branchId;

  factory SalesDetailsSpaItem.fromJson(Map<String, dynamic> json) => SalesDetailsSpaItem(
    spaItemId: json["spaItemId"] == null ? null : json["spaItemId"],
    salesDetailSpaId: json["salesDetailSpaId"] == null ? null : json["salesDetailSpaId"],
    price: json["price"] == null ? null : json["price"],
    branchId: json["branchId"] == null ? null : json["branchId"],
  );

  Map<String, dynamic> toJson() => {
    "spaItemId": spaItemId == null ? null : spaItemId,
    "salesDetailSpaId": salesDetailSpaId == null ? null : salesDetailSpaId,
    "price": price == null ? null : price,
    "branchId": branchId == null ? null : branchId,
  };
}
