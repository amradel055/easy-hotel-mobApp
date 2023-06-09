import 'package:get/get.dart';

class ItemMiniResponse {
  final int? id;

  final String? name;

  final double? price;

  final double? salePrice;

  final String? discribtion;

  final double? time;

  final double? discountValue;

  final double? discountRate;

  final int? discountType;

  final String? image;

  final num? reviewsStars;

   RxBool? isFav = RxBool(false);

  ItemMiniResponse(
      {this.id,
      this.name,
      this.price,
      this.salePrice,
      this.discribtion,
      this.time,
      this.discountValue,
      this.discountRate,
      this.discountType,
      this.image,
      required this.isFav,
      this.reviewsStars});


  static List<ItemMiniResponse> fromList(dynamic json) => List.from(json.map((e) => ItemMiniResponse.fromJson(e)));

  factory ItemMiniResponse.fromJson(Map<String, dynamic> json) => ItemMiniResponse(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      salePrice: json['salePrice'],
      discribtion: json['discribtion'],
      time: json['time'] == null ? null : json['time'].toDouble(),
      discountValue: json['discountValue'],
      discountRate: json['discountRate'],
      discountType: json['discountType'],
      image: json['image'],
      isFav: RxBool(false) ,
      reviewsStars: json['reviewsStars']);
}
