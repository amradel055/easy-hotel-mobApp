
import 'dart:convert';



class HousekeepingGroupResponse {
  HousekeepingGroupResponse({
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
    this.serial,
    this.name,
    this.parent,
    this.groupType,
    this.appId,
    this.img,
  });

  int? id;
  bool? markEdit;
  String? msg;
  String? msgType;
  String? markDisable;
  String? img;
  int? createdBy;
  DateTime? createdDate;
  int? index;
  int? companyId;
  String? createdByName;
  int? branchId;
  int? deletedBy;
  DateTime? deletedDate;
  int? igmaOwnerId;
  int? serial;
  String? name;
  int? parent;
  int? groupType;
  int? appId;

  static List<HousekeepingGroupResponse> fromList(dynamic json) => List.from(json.map((e) => HousekeepingGroupResponse.fromJson(e)));

  factory HousekeepingGroupResponse.fromJson( dynamic json) => HousekeepingGroupResponse(
    id: json["id"] == null ? null : json["id"],
    markEdit: json["markEdit"] == null ? null : json["markEdit"],
    msg: json["msg"] == null ? null : json["msg"],
    img: json["img"] == null ? null : json["img"],
    msgType: json["msgType"] == null ? null : json["msgType"],
    markDisable: json["markDisable"] == null ? null : json["markDisable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    index: json["index"] == null ? null : json["index"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    createdByName: json["createdByName"] == null ? null : json["createdByName"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    deletedBy: json["deletedBy"] == null ? null : json["deletedBy"],
    deletedDate: json["deletedDate"] == null ? null : DateTime.parse(json["deletedDate"]),
    igmaOwnerId: json["igmaOwnerId"] == null ? null : json["igmaOwnerId"],
    serial: json["serial"] == null ? null : json["serial"],
    name: json["name"] == null ? null : json["name"],
    parent: json["parent"] == null ? null : json["parent"],
    groupType: json["groupType"] == null ? null : json["groupType"],
    appId: json["appId"] == null ? null : json["appId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "markEdit": markEdit == null ? null : markEdit,
    "msg": msg == null ? null : msg,
    "msgType": msgType == null ? null : msgType,
    "markDisable": markDisable == null ? null : markDisable,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "index": index == null ? null : index,
    "companyId": companyId == null ? null : companyId,
    "createdByName": createdByName == null ? null : createdByName,
    "branchId": branchId == null ? null : branchId,
    "deletedBy": deletedBy == null ? null : deletedBy,
    "deletedDate": deletedDate == null ? null : deletedDate!.toIso8601String(),
    "igmaOwnerId": igmaOwnerId == null ? null : igmaOwnerId,
    "serial": serial == null ? null : serial,
    "img": img == null ? null : img,
    "name": name == null ? null : name,
    "parent": parent == null ? null : parent,
    "groupType": groupType == null ? null : groupType,
    "appId": appId == null ? null : appId,
  };
}
