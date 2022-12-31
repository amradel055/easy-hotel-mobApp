class SalesDetailsAttribute{

  int? id;
  int? attributeHeadId;
  int? attributeDetailsId;
  int? resSalesDetailsId;
  int? headPackUpId;
  int? isCloud;
  String? attributeDetailsName;

  SalesDetailsAttribute({this.id, this.attributeHeadId, this.attributeDetailsId, this.resSalesDetailsId, this.attributeDetailsName, this.isCloud, this.headPackUpId});

  factory SalesDetailsAttribute.fromJson(Map<String, dynamic> json){
    return SalesDetailsAttribute(
      id: json["id"],
      headPackUpId: json["headPackUpId"],
      isCloud: json["isCloud"],
      attributeDetailsName: json["attributeDetailsName"],
      attributeDetailsId: json["attributeDetailsId"],
      attributeHeadId: json["attributeHeadId"],
      resSalesDetailsId: json["resSalesDetailsId"],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "headPackUpId": headPackUpId,
      "isCloud": isCloud,
      "attributeDetailsId": attributeDetailsId,
      "attributeHeadId": attributeHeadId,
      "resSalesDetailsId": resSalesDetailsId,
    };
  }

}