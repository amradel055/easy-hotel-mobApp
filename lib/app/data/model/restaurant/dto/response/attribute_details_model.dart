


import 'package:easy_hotel/app/data/model/restaurant/dto/response/sales_details_attribute.dart';

class AttributeDetails {
  AttributeDetails({
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
    this.headId,
    this.itemId,
    this.orderBy,
    this.value,
  });

  int? id;
  bool? markEdit;
  dynamic msg;
  dynamic msgType;
  dynamic markDisable;
  int? createdBy;
  dynamic createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  dynamic branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  int? headId;
  int? itemId;
  int? orderBy;
  String? value;

  SalesDetailsAttribute get toDetailsAttribute{
    return SalesDetailsAttribute(
      attributeDetailsName: value,
      attributeDetailsId: id,
      attributeHeadId: headId,
    );
  }

  factory AttributeDetails.fromJson(Map<String, dynamic> json) => AttributeDetails(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"],
    msgType: json["msgType"],
    markDisable: json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"],
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"],
    createdByName: json["createdByName"],
    branchId: json["branchId"],
    deletedBy: json["deletedBy"],
    deletedDate: json["deletedDate"],
    igmaOwnerId: json["igmaOwnerId"],
    headId: json["headId"] == null ? null : json["headId"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    orderBy: json["orderBy"] == null ? null : json["orderBy"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg,
    "msgType": msgType,
    "markDisable": markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "headId": headId == null ? null : headId,
    "itemId": itemId == null ? null : itemId,
    "orderBy": orderBy == null ? null : orderBy,
    "value": value == null ? null : value,
  };
}
