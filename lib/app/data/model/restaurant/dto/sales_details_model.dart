
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/sales_details_additions.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/sales_details_attribute.dart';

class SalesDetails {
  SalesDetails({
    this.productReference,
    this.name,
    this.price,
    this.image,
    this.groupId,
    this.itemId,
    this.resSalesDetailsAttributeDTOList,
    this.resSalesDetailsAdditionsDTOList,
    this.deleteResSalesDetailsAdditionsDTOs,
    this.net,
    this.quantity,
    this.number,
    this.salePrice,
    this.remark,
    this.appId,
    this.resOfferId,
    this.resItemVariation,
    this.id ,
    this.createdDate,
    this.createdBy ,
    this.discountValue,
    this.discountType,
    this.discountRate,
    this.inventoryId,
    this.startDate,
    this.endDateDelivery,
    this.isCloud,
    this.headPackUpId,
  }) : localId = idCount++;

  static int idCount = 0;
  int localId = -1;
  ItemResponse? productReference;
  String? name;
  double? price;
  double? salePrice;
  String? image;
  int? groupId;
  int? itemId;
  double? net;
  double? discountValue;
  int? discountType;
  double? discountRate;
  double? quantity;
  double? number;
  String? remark;
  int? appId;
  int? resOfferId;
  int? resItemVariation;
  List<Additions>? additionsList = [];
  // List<Additions>? deletedAdditionsList = [];
  List<SalesDetailsAttribute>? resSalesDetailsAttributeDTOList = [];
  List<SalesDetailsAdditions>? resSalesDetailsAdditionsDTOList = [];
  List<SalesDetailsAdditions>? deleteResSalesDetailsAdditionsDTOs = [];
  int? id;
  DateTime? createdDate;
  DateTime? startDate;
  DateTime? endDateDelivery;
  int? createdBy;
  int? inventoryId ;
  int? headPackUpId;
  int? isCloud;

  num get sumPrice{
    num result = salePrice ?? price ?? 0;
    for(final add in resSalesDetailsAdditionsDTOList!){
      result += add.salePrice ?? add.price ?? 0;
    }
    return result * (quantity ?? 1);
  }

  String get nameWithAttribute {
    return "${(name??"-").split("-").first}-${(resSalesDetailsAttributeDTOList??[]).map((e) => e.attributeDetailsName??"").join("-")}";
  }

  factory SalesDetails.fromJson(Map<String, dynamic> json) => SalesDetails(
    name: json["name"],
    salePrice: json["salePrice"],
    discountRate: json["discountRate"],
    discountType: json["discountType"],
    discountValue: json["discountValue"],
    price: json["price"],
    image: json["image"],
    groupId: json["groupId"],
    itemId: json["itemId"],
    net: json["net"],
    quantity: json["quantity"],
    number: json["number"],
    remark: json["remark"],
    appId: json["appId"],
    id: json["id"],
    resOfferId: json["resOfferId"],
    resItemVariation: json["resItemVariation"],
    resSalesDetailsAttributeDTOList: List<SalesDetailsAttribute>.from((json["resSalesDetailsAttributeDTOList"]??[]).map((x) => SalesDetailsAttribute.fromJson(x))),
    resSalesDetailsAdditionsDTOList: List<SalesDetailsAdditions>.from((json["resSalesDetailsAdditionsDTOList"]??[]).map((x) => SalesDetailsAdditions.fromJson(x))),
    deleteResSalesDetailsAdditionsDTOs: List<SalesDetailsAdditions>.from((json["deleteResSalesDetailsAdditionsDTOs"]??[]).map((x) => SalesDetailsAdditions.fromJson(x))),
    createdBy : json["createdBy"],
    createdDate : json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    startDate : json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDateDelivery : json["endDateDelivery"] == null ? null : DateTime.parse(json["endDateDelivery"]),
    inventoryId: json["inventoryId"],
    headPackUpId: json["headPackUpId"],
    isCloud: json["isCloud"],

  );

  Map<String, dynamic> toJson() => {
    "headPackUpId": headPackUpId,
    "isCloud": isCloud,
    "name": name,
    "salePrice": salePrice,
    "price": price,
    "image": image,
    "groupId": groupId,
    "itemId": itemId,
    "net": net,
    "quantity": quantity,
    "number": number,
    "remark": remark,
    "discountValue": discountValue,
    "discountType": discountType,
    "discountRate": discountRate,
    "appId": appId,
    "id": id,
    "resOfferId": resOfferId,
    "resItemVariation": resItemVariation,
    "resSalesDetailsAttributeDTOList": List<dynamic>.from((resSalesDetailsAttributeDTOList??[]).map((x) => x.toJson())),
    "resSalesDetailsAdditionsDTOList": List<dynamic>.from((resSalesDetailsAdditionsDTOList??[]).map((x) => x.toJson())),
    "deleteResSalesDetailsAdditionsDTOs": List<dynamic>.from((deleteResSalesDetailsAdditionsDTOs??[]).map((x) => x.toJson())),
    "createdDate": createdDate == null ? null : createdDate!.toIso8601String(),
    "startDate": startDate?.toIso8601String(),
    "endDateDelivery": endDateDelivery?.toIso8601String(),
    "createdBy": createdBy,
    "inventoryId": inventoryId,
  };
}
