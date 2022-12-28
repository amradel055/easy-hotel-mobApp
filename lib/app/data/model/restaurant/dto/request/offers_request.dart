

class OffersRequest {


  final int appId ;
  final int currencySerial ;
  final int branchId ;

  OffersRequest({required this.appId,required this.currencySerial,required this.branchId});


  Map<String , dynamic> toJson() => {
    "appId" : appId ,
    "currencySerial" : currencySerial,
    "branchId" : branchId ,
};
}