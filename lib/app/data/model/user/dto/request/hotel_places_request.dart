


class HotelPalcesRequest {
    final int branchId ;

    const HotelPalcesRequest(this.branchId);

    Map<String , dynamic> toJson() => {"branchId" : branchId};
}