

class HallsPeriodsResponse {
  HallsPeriodsResponse({required this.id,this.name,required this.date,this.enabled});

  final int id ;
  final String? name ;
  final DateTime? date ;
  bool? enabled = true;


  static List<HallsPeriodsResponse> fromList(dynamic json) => List.from(json.map((e) => HallsPeriodsResponse.fromJson(e)));

  factory HallsPeriodsResponse.fromJson(Map<String , dynamic> json) => HallsPeriodsResponse(
      name: json['name'],
      id: json['id'],
      date: json['date'],
      enabled: true
  );

  Map<String , dynamic> toJson() => {
    "id" : id ,
    "name" : name ,
    "date" : date != null ? date!.toIso8601String() : null ,
  };
}