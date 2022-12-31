class SalesDetailsAdditions {
  int? resSalesDetailsId;
  int? id;
  int? additionId;
  String? additionName;
  int? isCloud;
  int? headPackUpId;
  num? price;
  num? discount;
  int? discountType;
  num? salePrice;

  SalesDetailsAdditions({
    this.id,
    this.resSalesDetailsId,
    this.additionId,
    this.additionName,
    this.isCloud,
    this.headPackUpId,
    this.price,
    this.discount,
    this.discountType,
    this.salePrice,
  });

  factory SalesDetailsAdditions.fromJson(Map<String, dynamic> json) {
    return SalesDetailsAdditions(
      id: json["id"],
      headPackUpId: json["headPackUpId"],
      isCloud: json["isCloud"],
      resSalesDetailsId: json["resSalesDetailsId"],
      additionId: json["additionId"],
      additionName: json["additionName"],
      price: json["price"],
      discount: json["discount"],
      discountType: json["discountType"],
      salePrice: json["salePrice"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "headPackUpId": headPackUpId,
      "isCloud": isCloud,
      "resSalesDetailsId": resSalesDetailsId,
      "additionName": additionName,
      "additionId": additionId,
      "price": price,
      "discount": discount,
      "discountType": discountType,
      "salePrice": salePrice,
    };
  }
}
