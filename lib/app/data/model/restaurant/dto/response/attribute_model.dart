




import 'attribute_details_model.dart';

class Attribute {
  Attribute({
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
    this.name,
    this.parent,
    this.terms,
    this.itemId,
    this.headId,
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
  String? name;
  dynamic parent;
  List<AttributeDetails>? terms;
  int? itemId;
  int? headId;
  int? orderBy;
  String? value;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
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
    name: json["name"] == null ? null : json["name"],
    parent: json["parent"],
    terms: json["terms"] == null ? null : List<AttributeDetails>.from(json["terms"].map((x) => AttributeDetails.fromJson(x))),
    itemId: json["itemId"] == null ? null : json["itemId"],
    headId: json["headId"] == null ? null : json["headId"],
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
    "name": name == null ? null : name,
    "parent": parent,
    "terms": terms == null ? null : List<dynamic>.from(terms!.map((x) => x.toJson())),
    "itemId": itemId == null ? null : itemId,
    "headId": headId == null ? null : headId,
    "orderBy": orderBy == null ? null : orderBy,
    "value": value == null ? null : value,
  };
}
