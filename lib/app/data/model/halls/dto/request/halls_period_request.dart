



class HallsPeriodsRequest {
  HallsPeriodsRequest({required this.id,required this.branchId, this.date});

  final int id ;
  final int branchId ;
  final DateTime? date ;


  Map<String , dynamic> toJson() => {
    "id" : id ,
    "branchId" : branchId ,
    "date" : date == null ? null : date!.toIso8601String()
  };
}