// To parse this JSON data, do
//
//     final salesDetailsSpa = salesDetailsSpaFromJson(jsonString);

import 'dart:convert';

import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';




class ApplicationRequest {
  ApplicationRequest({
    this.id,

  });

  int? id;


  factory ApplicationRequest.fromJson( dynamic json) => ApplicationRequest(
      id: json["id"] == null ? null : json["id"],

  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,

  };
}
