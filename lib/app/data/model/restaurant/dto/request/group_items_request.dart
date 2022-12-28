

class GroupItemsRequest {

  final int groupId ;
  final int currencySerial;

  GroupItemsRequest({required this.groupId, required this.currencySerial});

  Map<String , dynamic> toJson() => {
    "groupId" : groupId ,
    "currencySerial" : currencySerial
};
}