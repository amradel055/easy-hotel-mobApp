
import 'dart:convert';

class RoomcityResponse {
  RoomcityResponse({
    this.hotelName,
    this.cityName,
    this.rate,
    this.price,
    this.image,
    this.id
  });

  String ?hotelName;
  String ?cityName;
  double ?rate;
  double ?price;
  String? image;
  int? id;
  static List<RoomcityResponse> fromList(dynamic json) => List.from(json.map((e) => RoomcityResponse.fromJson(e)));

  factory RoomcityResponse.fromRawJson(String str) => RoomcityResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomcityResponse.fromJson(Map<String, dynamic> json) => RoomcityResponse(
    hotelName: json["hotelName"] == null ? null : json["hotelName"],
    cityName: json["cityName"] == null ? null : json["cityName"],
    rate: json["rate"] == null ? null : json["rate"].toDouble(),
    price: json["price"] == null ? null : json["price"].toDouble(),
    image: json["image"] == null ? null : json["image"],
    id: json["id"] == null ? null : json["id"],

  );

  Map<String, dynamic> toJson() => {
    "hotelName": hotelName == null ? null : hotelName,
    "cityName": cityName == null ? null : cityName,
    "rate": rate == null ? null : rate,
    "price": price == null ? null : price,
    "image": image == null ? null : image,
    "id": id == null ? null : id,

  };
}
