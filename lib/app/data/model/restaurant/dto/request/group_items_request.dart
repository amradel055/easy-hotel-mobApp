

class GroupItemsRequest {

  final int ?groupId ;
  final int ?currencySerial;

  GroupItemsRequest({ this.groupId,  this.currencySerial});

  Map<String , dynamic> toJson() => {
    "groupId" : groupId ,
    "currencySerial" : currencySerial
};
}