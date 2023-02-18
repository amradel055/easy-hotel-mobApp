

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
    this.trafficId,
    this.carId,
    this.carName,
    this.groupId,
    this.groupName,
    this.personNumber,
    this.isGoingAndRetrun,
    this.dueDate,
    this.dueTime,
    this.salesId,
    this.remark,
    this.phone,
    this.email,
    this.name,
    this.customerName,
    this.datet,
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
  int? trafficId;
  int? carId;
  String? carName;
  int? groupId;
  String? groupName;
  int? personNumber;
  int? isGoingAndRetrun;
  DateTime? dueDate;
  DateTime? dueTime;
  DateTime? datet;
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
    "trafficId": trafficId == null ? null : trafficId,
    "carId": carId == null ? null : carId,
    "carName": carName == null ? null : carName,
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName == null ? null : groupName,
    "personNumber": personNumber == null ? null : personNumber,
    "isGoingAndRetrun": isGoingAndRetrun == null ? null : isGoingAndRetrun,
    "dueDate": dueDate == null ? null : dueDate?.toIso8601String(),
    "dueTime": dueTime == null ? null : dueTime?.toIso8601String(),
    "datet": datet == null ? null : datet?.toIso8601String(),
    "salesId": salesId == null ? null : salesId,
    "remark": remark == null ? null : remark,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "customerName": customerName == null ? null : customerName,
  };
}