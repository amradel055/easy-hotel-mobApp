





import 'package:easy_hotel/app/data/model/restaurant/dto/response/variation_details_model.dart';

class Variation {
  Variation({
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
    this.itemId,
    this.image,
    this.describtion,
    this.price,
    this.salePrice,
    this.variationDetails,
    this.variationDetailsName
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
  dynamic itemId;
  dynamic image;
  String? describtion;
  num? price;
  num? salePrice;
  List<VariationDetails>? variationDetails;
  String? variationDetailsName;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
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
    itemId: json["itemId"],
    image: json["image"],
    describtion: json["describtion"] == null ? null : json["describtion"],
    price: json["price"] == null ? null : json["price"],
    salePrice: json["salePrice"],
    variationDetails: json["variationDetails"] == null ? null : List<VariationDetails>.from(json["variationDetails"].map((x) => VariationDetails.fromJson(x))),
    variationDetailsName: json["variationDetailsName"] == null ? null : json["variationDetailsName"] ,

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
    "itemId": itemId,
    "image": image,
    "describtion": describtion == null ? null : describtion,
    "price": price == null ? null : price,
    "salePrice": salePrice,
    "variationDetails": variationDetails == null ? null : List<dynamic>.from(variationDetails!.map((x) => x.toJson())),
    "variationDetailsName": variationDetailsName == null ? null : variationDetailsName,

  };
}

