import 'package:easy_hotel/app/data/model/base_request.dart';

class ReviewRequestDto extends BaseRequest {
  ReviewRequestDto({
    this.invOrganizationId,
    this.itemId,
    this.reviewText,
    this.reviewId,
    this.createdBy,
    this.branchId,
    this.companyId,
    this.rate,
    this.appId,
    this.detailId,

  });

  int? invOrganizationId;
  int? itemId;
  String? reviewText;
  int? reviewId;
  int? createdBy;
  int? branchId;
  int? companyId;
  int? rate;
  int? appId;
  int? detailId;


  @override
  Map<String, dynamic> toJson() => {
    "invOrganizationId": invOrganizationId == null ? null : invOrganizationId,
    "itemId": itemId == null ? null : itemId,
    "reviewText": reviewText == null ? null : reviewText,
    "reviewId": reviewId == null ? null : reviewId,
    "createdBy": createdBy == null ? null : createdBy,
    "branchId": branchId == null ? null : branchId,
    "companyId": companyId == null ? null : companyId,
    "rate": rate == null ? null : rate,
    "appId": appId == null ? null : appId,
    "detailId": detailId == null ? null : detailId,


  };
}
