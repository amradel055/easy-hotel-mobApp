// To parse this JSON data, do
//
//     final salesDetailsSpa = salesDetailsSpaFromJson(jsonString);

import '../response/maintenance_detail_response.dart';

class MaintenanceSaveRequest {
  MaintenanceSaveRequest({
    // this.serviceTypeId,
    this.branchId,
    this.createdBy,
    this.companyId,
    this.maintenanceDTOList,
    this.customerId,
    this.dueDate,
    this.dueTime,
    this.remark,
    this.phone,
    this.email,
    this.name,
  });

  // int? serviceTypeId;
  int? branchId;
  int?createdBy;
  int?companyId;
  List<MaintenanceDetailResponse>? maintenanceDTOList ;
  int? customerId ;
  DateTime? dueDate ;
  DateTime? dueTime ;
  String? remark ;
  String ?phone;
  String?email;
  String?name;

  factory MaintenanceSaveRequest.fromJson( dynamic json) => MaintenanceSaveRequest(
      // serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
      customerId: json["customerId"] == null ? null : json["customerId"],
      createdBy: json["createdBy"] == null ? null : json["createdBy"],
      companyId: json["companyId"] == null ? null : json["companyId"],
      branchId: json["branchId"] == null ? null : json["branchId"],
      remark: json["remark"] == null ? null : json["remark"],
    maintenanceDTOList: json["maintenanceDTOList"] == null ? null : List<MaintenanceDetailResponse>.from(json["maintenanceDTOList"].map((x) => x)),

    // salesDetailMaintenanceDTOList : json["salesDetailMaintenanceDTOList"] == null ? null : List<int>.from(json["salesDetailMaintenanceDTOList"].map((e) => SalesDetailsSpaItem.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    // "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "remark": remark == null ? null : remark,
    "dueTime": dueTime == null ? null : dueTime?.toIso8601String(),
    "dueDate": dueDate == null ? null : dueDate?.toIso8601String(),
    "maintenanceDTOList" : maintenanceDTOList == null ? null : List<dynamic>.from(maintenanceDTOList!.map((x) => x.toJson())),


    // "salesDetailMaintenanceDTOList": salesDetailMaintenanceDTOList == null ? null : List<dynamic>.from(salesDetailMaintenanceDTOList!.map((x) => x)),
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
  };
}
