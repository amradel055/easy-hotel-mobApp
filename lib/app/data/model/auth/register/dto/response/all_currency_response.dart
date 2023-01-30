// To parse this JSON data, do
//
//     final currencyResponse = currencyResponseFromJson(jsonString);

import 'dart:convert';

CurrencyResponse? currencyResponseFromJson(String str) => CurrencyResponse.fromJson(json.decode(str));

String currencyResponseToJson(CurrencyResponse? data) => json.encode(data!.toJson());

class CurrencyResponse {
  CurrencyResponse({
    this.id,
    this.name,
    this.code,
  });

  int? id;
  String? name;
  String? code;
  static List<CurrencyResponse> fromList(dynamic json) => List.from(json.map((e) => CurrencyResponse.fromJson(e)));

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => CurrencyResponse(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}
