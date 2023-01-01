



import 'package:easy_hotel/app/data/model/restaurant/dto/response/sales_details_additions.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/sales_details_model.dart';

class Sales {
  Sales({
    this.id,
    this.customerName,
    this.customerMobile,
    this.gallaryName,
    this.invoiceDate,
    this.takeDate,
    this.status,
    this.invoiceNumber,
    this.remarks,
    this.customerId,
    this.currencySerial,
    this.deliveryPlace,
    this.offerId,
    this.tax,
    this.salesDetialList,
    this.salesDetialListDeleted,
    this.address ,
    this.expanded ,
    this.orderStatus,
    this.branchId ,
    // this.aPIBankTransactionList,
    this.totalPrice,
    this.allDetailsName,
    this.time,
    this.createdDate,
    this.selected,
    this.headPackUpId,
    this.isCloud,
    this.typeSave,
    this.isOpen,
    this.orderType,
    this.orderTypeValue,
    this.tableNumber,
    this.createdBy,
    this.companyId,
    this.inventoryId,
    this.bankId,
    this.createdByName,
    this.discountType,
    this.discountValue,
    this.startDate,
    this.transactionId,
    this.endDateDelivery,
  }){
    calc();
  }

  String? customerName;
  String? customerMobile;
  String? gallaryName;
  DateTime? invoiceDate;
  DateTime? takeDate;
  DateTime? createdDate;
  DateTime? startDate;
  DateTime? endDateDelivery;
  String? status;
  int? orderStatus ;
  int? transactionId;
  String? invoiceNumber;
  String? remarks;
  String? address;
  int? customerId;
  int? currencySerial;
  int? deliveryPlace;
  int? offerId;
  num? tax;
  List<SalesDetails>? salesDetialList = [];
  List<SalesDetails>? salesDetialListDeleted = [];
  // List<APIBankTransactionDTO>? aPIBankTransactionList;
  bool? expanded = false;
  double? height;
  int? branchId;
  double? totalPrice ;
  String? allDetailsName;
  int? id ;
  double? time ;
  bool? selected = false ;
  int? headPackUpId ;
  int? isCloud ;
  int? typeSave ;
  int? orderType;
  String? orderTypeValue;
  int? isOpen;
  int? tableNumber;
  int? discountType;
  num? discountValue;
  int? createdBy ;
  int? companyId ;
  int? inventoryId;
  int? bankId;
  String? createdByName;

  num discountHalalah = 0;
  num totalPriceWithoutDiscountHalala = 0;

  double get net {
    double result = 0.0;
    for(SalesDetails details in salesDetialList??[]){
      double price = 0;
      for(SalesDetailsAdditions add in details.resSalesDetailsAdditionsDTOList!){
        price  += add.salePrice??add.price??0;
      }
      result += ((details.salePrice??0) + price) * (details.quantity??1);
    }
    return result;
  }

  calc([bool removeHalalah = true]) {
    if(removeHalalah) {
      discountHalalah = 0;
    }
    if(discountType == 1) {
      totalPrice = net - (net * ((discountValue ?? 0) / 100));
    } else {
      totalPrice = net - (discountValue??0);
    }
    totalPrice = totalPrice! + (totalPrice! * ((tax??0)/100));
    totalPriceWithoutDiscountHalala = totalPrice!;
    totalPrice = totalPrice! - discountHalalah;
  }

  // removeHalalah(){
  //   int number = totalPriceWithoutDiscountHalala.floor();
  //   num remain = totalPriceWithoutDiscountHalala - number;
  //   discountHalalah = remain;
  //   calc(false);
  // }

  // CustomerModel get customer {
  //   return CustomerModel(
  //     id: customerId,
  //     mobile: customerMobile,
  //     name: customerName,
  //     address: address
  //   );
  // }

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
    customerName: json["customerName"],
    discountType: json["discountType"],
    discountValue: json["discountValue"],
    customerMobile: json["customerMobile"],
    transactionId: json["transactionId"],
    gallaryName: json["gallaryName"],
    invoiceDate: json["invoiceDate"] == null ? null : DateTime.parse(json["invoiceDate"]),
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    takeDate: json["takeDate"] == null ? null :  DateTime.parse(json["takeDate"]),
    startDate: json["takeDate"] == null ? null :  DateTime.parse(json["startDate"]),
    endDateDelivery: json["endDateDelivery"] == null ? null :  DateTime.parse(json["endDateDelivery"]),
    // aPIBankTransactionList: List<APIBankTransactionDTO>.from((json['aPIBankTransactionList']??[]).map((e) => APIBankTransactionDTO.fromJson(e))),
    status: json["status"],
    invoiceNumber: json["invoiceNumber"],
    remarks: json["remarks"],
    address: json["address"],
    customerId: json["customerId"],
    currencySerial: json["currencySerial"],
    deliveryPlace: json["deliveryPlace"],
    offerId: json["offerId"],
    tax: json["tax"],
    salesDetialList: List<SalesDetails>.from((json["salesDetialList"]??[]).map((x) => SalesDetails.fromJson(x))),
    salesDetialListDeleted: List<SalesDetails>.from((json["salesDetialListDeleted"]??[]).map((x) => SalesDetails.fromJson(x))),
    expanded: false ,
    orderStatus :  json["orderStatus"],
    totalPrice :  json["totalPrice"] == null ? null : double.parse(json["totalPrice"].toString()),
    allDetailsName: json["allDetailsName"],
    id: json["id"],
    time: json["time"] == null ? null : double.parse(json["time"].toString()),
    selected: false ,
    headPackUpId: json["headPackUpId"],
    isCloud: json["isCloud"],
    typeSave: json["typeSave"],
    branchId: json["branchId"],
    orderType: json["orderType"],
    orderTypeValue: json["orderTypeValue"],
    tableNumber: json["tableNumber"],
    isOpen: json["isOpen"],
    createdBy: json["createdBy"],
    companyId: json["companyId"],
    inventoryId: json["inventoryId"],
    bankId: json["bankId"],
  );

  Map<String, dynamic> toJson() => {
    // "aPIBankTransactionList": List<dynamic>.from((aPIBankTransactionList??[]).map((e) => e.toJson())),
    "customerName": customerName,
    "transactionId": transactionId,
    "customerMobile": customerMobile,
    "gallaryName": gallaryName,
    "invoiceDate": invoiceDate == null ? null : invoiceDate!.toIso8601String(),
    "takeDate": takeDate == null ? null : takeDate!.toIso8601String(),
    "startDate": startDate?.toIso8601String(),
    "endDateDelivery": endDateDelivery?.toIso8601String(),
    "status": status,
    "invoiceNumber": invoiceNumber,
    "remarks": remarks,
    "address": address,
    "discountValue": discountValue,
    "discountType": discountType,
    "customerId": customerId,
    "currencySerial": currencySerial,
    "deliveryPlace": deliveryPlace,
    "offerId": offerId,
    "tax": tax,
    "salesDetialList": salesDetialList == null ? null : List<dynamic>.from(salesDetialList!.map((x) => x.toJson())),
    "salesDetialListDeleted": salesDetialListDeleted == null ? null : List<dynamic>.from(salesDetialListDeleted!.map((x) => x.toJson())),
    "orderStatus": orderStatus,
    "totalPrice": totalPrice,
    "allDetailsName": allDetailsName,
    "id": id,
    "headPackUpId": headPackUpId,
    "typeSave": typeSave,
    "isCloud": isCloud,
    "branchId": branchId,
    "orderType": orderType,
    "orderTypeValue": orderTypeValue,
    "tableNumber": tableNumber,
    "isOpen": isOpen,
    "createdBy": createdBy,
    "companyId": companyId,
    "inventoryId": inventoryId,
    "bankId": bankId,
  };
}
