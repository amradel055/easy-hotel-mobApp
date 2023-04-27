class GetHotelForServicesRequest {
  int? invOrganizationId;
  int? customerId;

  GetHotelForServicesRequest({this.invOrganizationId, this.customerId});

  Map<String, dynamic> toJson() => invOrganizationId != null
      ? {
          "invOrganizationId": invOrganizationId,
        }
      : {
          "customerId": customerId,
        };
}
