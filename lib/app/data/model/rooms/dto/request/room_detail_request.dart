class RoomDetailRequest {
  RoomDetailRequest({
    required this.id,
  });

  int id;

  factory RoomDetailRequest.fromJson(Map<String, dynamic> json) => RoomDetailRequest(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}