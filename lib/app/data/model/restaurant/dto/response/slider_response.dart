class SlidersResponse {
  final String? name;
  final String? imgUrl;
  final int? itemType;
  final int? itemId;
  final String? pageName;

  SlidersResponse({this.name, this.imgUrl, this.itemType, this.itemId, this.pageName});

  static List<SlidersResponse> fromList(dynamic json) => List.from(json.map((e) => SlidersResponse.fromJson(e)));

  factory SlidersResponse.fromJson(Map<String, dynamic> json) => SlidersResponse(
        name: json['name'],
        imgUrl: json['imgUrl'],
        itemType: json['itemType'],
        itemId: json['itemId'],
        pageName: json['pageName'],
      );
}
