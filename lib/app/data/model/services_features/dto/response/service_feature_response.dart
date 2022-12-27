


class ServiceFeatureResponse {
  ServiceFeatureResponse({this.name, this.description, this.icon});

  final String? name;
  final String? description;
  final String? icon;


  static List<ServiceFeatureResponse> fromList(dynamic json) => List.from(json.map((e) => ServiceFeatureResponse.fromJson(e)));

  factory ServiceFeatureResponse.fromJson(Map<String , dynamic> json) => ServiceFeatureResponse(
    name: json['name'] ,
    description: json['description'],
    icon: json['icon'],
  );
}