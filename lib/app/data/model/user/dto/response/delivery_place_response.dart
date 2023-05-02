class DeliveryPlaceResponse {
  final int id;
  final String name;

  const DeliveryPlaceResponse({required this.id, required this.name});

  static List<DeliveryPlaceResponse> fromList(dynamic list) =>
      List.from(list.map((e) => DeliveryPlaceResponse.fromJson(e)));
      
  factory DeliveryPlaceResponse.fromJson(Map<String, dynamic> json) =>
      DeliveryPlaceResponse(id: json["id"], name: json["name"]);
}
