


class CarsPriceResponse {
    final num? price;
    final num? discountValue;
    final num? discountType;
    final num? discountRate;
    final num? salePrice;
    final bool? saleItem;

    const CarsPriceResponse({
      required this.discountRate,
      required this.discountValue,
      required this.discountType,
      required this.saleItem,
      required this.salePrice,
      required this.price,
    });


    factory CarsPriceResponse.fromJson(dynamic json) => CarsPriceResponse(
      discountRate: json["discountRate"],
       discountValue: json["discountValue"],
        discountType: json["discountType"],
         saleItem: json["saleItem"],
          salePrice: json["salePrice"],
           price: json["price"]);

}