

class CarsResponse {
  CarsResponse({
        this.id,
        this.index,
        this.name,
        this.describtion,
        this.groupId,
        this.groupName,
        this.phone,
        this.code,
        this.type,
        this.pricePerDay,
        this.image,
        this.branchId,
        this.seatsNumber});

  int? id;
  int? index;
  String? name;
  String? describtion;
  int? groupId;
  String? groupName;
  String? phone;
  String? code;
  dynamic? type;
  double? pricePerDay;
  dynamic image;
  int? seatsNumber;
  int? branchId;

  static List<CarsResponse> fromList(dynamic json) => List.from(json.map((e) => CarsResponse.fromJson(e)));

  factory CarsResponse.fromJson(Map<String, dynamic> json) => CarsResponse(
    id: json["id"] == null ? null : json["id"],
    index: json["index"] == null ? null : json["index"],
    name: json["name"] == null ? null : json["name"],
    describtion: json["describtion"] == null ? null : json["describtion"],
    groupId: json["groupId"] == null ? null : json["groupId"],
    groupName: json["groupName"] == null ? null : json["groupName"],
    phone: json["phone"] == null ? null : json["phone"],
    code: json["code"] == null ? null : json["code"],
    type: json["type"],
    pricePerDay: json["pricePerDay"] == null ? null : json["pricePerDay"],
    image: json["image"],
    seatsNumber: json["seatsNumber"] == null ? null : json["seatsNumber"],
    branchId: json["branchId"] == null ? null : json["branchId"],
  );

}