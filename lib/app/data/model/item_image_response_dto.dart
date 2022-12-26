


class ItemImageResponse {
  
  final String image ;

  ItemImageResponse({required this.image});

  static List<ItemImageResponse> fromList(dynamic json) => List.from(json.map((e) => ItemImageResponse.fromJson(e)));

  factory ItemImageResponse.fromJson(Map<String , dynamic> json) => ItemImageResponse(
    image: json['image']
  );
}