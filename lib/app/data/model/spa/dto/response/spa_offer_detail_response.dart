


class SpaOfferDetailResponse {
  SpaOfferDetailResponse({required this.id,required this.spaItemId});

  final int? id ;
  final int? spaItemId;

  static List<SpaOfferDetailResponse> fromList(dynamic json) => List.from(json.map((e) => SpaOfferDetailResponse.fromJson(e)));

  factory SpaOfferDetailResponse.fromJson(Map<String , dynamic> json) => SpaOfferDetailResponse(
    id: json['id'] ,
    spaItemId: json['spaItemId']
  );

}