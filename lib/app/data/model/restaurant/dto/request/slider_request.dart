

class SlidersRequest {


  final int appId ;
  final int pageId ;
  final int positionNumber ;
  final int branchId ;

  SlidersRequest({required this.appId,required this.pageId,required this.positionNumber,required this.branchId});


  Map<String , dynamic> toJson() => {
    "appId" : appId ,
    "pageNumber" : pageId,
    "positionNumber" : positionNumber ,
    "branchId" : branchId ,
};
}