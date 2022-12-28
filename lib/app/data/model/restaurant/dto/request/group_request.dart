

class GroupRequest {

  final int appId ;
  final int branchId ;

  GroupRequest({required this.appId, required this.branchId});

  Map<String,dynamic> toJson() => {
    "appId" : appId ,
    "branchId" : branchId ,
  };
}