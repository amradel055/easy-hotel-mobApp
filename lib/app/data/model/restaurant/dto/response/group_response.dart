

class GroupResponse {


  final int? id ;
  final String? img ;
  final String? name ;

  GroupResponse({this.id, this.img, this.name});

  static List<GroupResponse> fromList(dynamic json) => List.from(json.map((e) => GroupResponse.fromJson(e)));

  factory GroupResponse.fromJson(Map<String , dynamic> json) => GroupResponse(
    id: json['id'],
    img: json['img'],
    name: json['name'],
  );
}