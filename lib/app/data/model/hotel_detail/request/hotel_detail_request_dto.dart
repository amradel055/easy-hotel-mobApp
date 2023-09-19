class HotelDetailRequest {
  HotelDetailRequest({
    required this.id,
  });

  int id;

  factory HotelDetailRequest.fromJson(Map<String, dynamic> json) => HotelDetailRequest(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}