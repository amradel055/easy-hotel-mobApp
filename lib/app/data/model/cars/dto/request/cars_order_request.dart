

class CarsOrderRequest {
  CarsOrderRequest({
    this.id,
    this.createdBy,
    this.createdDate,
    this.index,
    this.companyId,
    this.createdByName,
    this.branchId,
    this.deletedBy,
    this.deletedDate,
    this.igmaOwnerId,
    this.companyCode,
    this.branchSerial,
    this.igmaOwnerSerial,
    this.customerId,
    this.fromDestination,
    this.carId,
    this.carName,
    this.groupId,
    this.groupName,
    this.personNumber,
    this.isGoingAndRetrun,
    this.comingDate,
    this.comingTime,
    this.salesId,
    this.remark,
    this.phone,
    this.email,
    this.name,
    this.customerName,
  });


  int? id;
  int? createdBy;
  DateTime? createdDate;
  int? index;
  dynamic companyId;
  dynamic createdByName;
  int? branchId;
  dynamic deletedBy;
  dynamic deletedDate;
  dynamic igmaOwnerId;
  dynamic companyCode;
  dynamic branchSerial;
  dynamic igmaOwnerSerial;
  dynamic customerId;
  int? fromDestination;
  int? carId;
  String? carName;
  int? groupId;
  String? groupName;
  int? personNumber;
  int? isGoingAndRetrun;
  DateTime? comingDate;
  String? comingTime;
  int? salesId;
  String? remark;
  String ?phone;
  String?email;
  String?name;
  String?customerName;


  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "index": index == null ? null : index,
    "companyId": companyId,
    "createdByName": createdByName,
    "branchId": branchId == null ? null : branchId,
    "deletedBy": deletedBy,
    "deletedDate": deletedDate,
    "igmaOwnerId": igmaOwnerId,
    "companyCode": companyCode,
    "branchSerial": branchSerial,
    "igmaOwnerSerial": igmaOwnerSerial,
    "customerId": customerId,
    "fromDestination": fromDestination == null ? null : fromDestination,
    "carId": carId == null ? null : carId,
    "carName": carName == null ? null : carName,
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,
    "personNumber": personNumber == null ? null : personNumber,
    "isGoingAndRetrun": isGoingAndRetrun == null ? null : isGoingAndRetrun,
    "comingDate": comingDate == null ? null : comingDate?.toIso8601String(),
    "comingTime": comingTime == null ? null : comingTime,
    "salesId": salesId == null ? null : salesId,
    "remark": remark == null ? null : remark,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "customerName": customerName == null ? null : customerName,
  };
}