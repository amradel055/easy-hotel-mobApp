// To parse this JSON data, do
//
//     final reviewsResponse = reviewsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';

ReviewsResponse reviewsResponseFromJson(String str) => ReviewsResponse.fromJson(json.decode(str));

String reviewsResponseToJson(ReviewsResponse data) => json.encode(data.toJson());

class ReviewsResponse {
  ReviewsResponse({
    this.starAverage,
    this.reviewFoodDtoList,
    this.reviewCarDtoList,
    this.reviewRoomDtoList,
    this.reviewSpaDtoList,
    this.reviewMaintenanceDtoList,
    this.reviewHoleDtoList,
  });

  double ?starAverage;
  dynamic reviewFoodDtoList;
  List<dynamic>? reviewCarDtoList;
  List<dynamic>? reviewRoomDtoList;
  List<dynamic>? reviewSpaDtoList;
  List<ReviewModel>? reviewMaintenanceDtoList;
  List<dynamic>? reviewHoleDtoList;

  factory ReviewsResponse.fromJson( dynamic json) => ReviewsResponse(
    starAverage: json["starAverage"] == null ? null : json["starAverage"].toDouble(),
    reviewFoodDtoList: json["reviewFoodDTOList"],
    reviewCarDtoList: json["reviewCarDTOList"] == null ? null : List<dynamic>.from(json["reviewCarDTOList"].map((x) => x)),
    reviewRoomDtoList: json["reviewRoomDTOList"] == null ? null : List<dynamic>.from(json["reviewRoomDTOList"].map((x) => x)),
    reviewSpaDtoList: json["reviewSpaDTOList"] == null ? null : List<dynamic>.from(json["reviewSpaDTOList"].map((x) => x)),
    reviewMaintenanceDtoList: json["reviewMaintenanceDTOList"] == null ? null : List<ReviewModel>.from(json["reviewMaintenanceDTOList"].map((x) => ReviewModel.fromJson(x))),
    reviewHoleDtoList: json["reviewHoleDTOList"] == null ? null : List<dynamic>.from(json["reviewHoleDTOList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "starAverage": starAverage == null ? null : starAverage,
    "reviewFoodDTOList": reviewFoodDtoList,
    "reviewCarDTOList": reviewCarDtoList == null ? null : List<dynamic>.from(reviewCarDtoList!.map((x) => x)),
    "reviewRoomDTOList": reviewRoomDtoList == null ? null : List<dynamic>.from(reviewRoomDtoList!.map((x) => x)),
    "reviewSpaDTOList": reviewSpaDtoList == null ? null : List<dynamic>.from(reviewSpaDtoList!.map((x) => x)),
    "reviewMaintenanceDTOList": reviewMaintenanceDtoList == null ? null : List<dynamic>.from(reviewMaintenanceDtoList!.map((x) => x.toJson())),
    "reviewHoleDTOList": reviewHoleDtoList == null ? null : List<dynamic>.from(reviewHoleDtoList!.map((x) => x)),
  };
}

