// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

ReviewModel sliderModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String sliderModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.id,
    this.itemId,
    this.appId,
    this.invOrganizationId,
    this.reviewDate,
    this.reviewStars,
    this.reviewText,
    this.customerName
  });

   int? itemId;
   int? appId;
   int? invOrganizationId;
   int? reviewStars;
   DateTime? reviewDate;
   String? reviewText;
   String? customerName;
   int? id;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json["id"] == null ? null : json["id"],
    reviewDate: json["reviewDate"] == null ? null : DateTime.parse(json["reviewDate"]),
    reviewStars: json["reviewStars"] == null ? null : json["reviewStars"],
    itemId: json["itemId"] == null ? null : json["itemId"],
    appId: json["appId"] == null ? null : json["appId"],
    invOrganizationId: json["invOrganizationId"] == null ? null : json["invOrganizationId"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    reviewText: json["reviewText"] == null ? null : json["reviewText"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "reviewDate": reviewDate == null ? null : reviewDate!.toIso8601String(),
    "reviewStars": reviewStars == null ? null : reviewStars,
    "itemId": itemId == null ? null : itemId,
    "appId": appId == null ? null : appId,
    "invOrganizationId": invOrganizationId == null ? null : invOrganizationId,
    "customerName": customerName == null ? null : customerName,
    "reviewText": reviewText == null ? null : reviewText,
  };
}
