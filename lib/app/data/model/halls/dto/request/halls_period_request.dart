



class HallsPeriodsRequest {
  HallsPeriodsRequest({required this.id, this.date});

  final int id ;
  final DateTime? date ;


  Map<String , dynamic> toJson() => {
    "id" : id ,
    "date" : date == null ? null : date!.toIso8601String()
  };
}