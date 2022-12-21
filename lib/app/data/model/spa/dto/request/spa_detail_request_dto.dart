class SpaDetailRequest {
  SpaDetailRequest({
    this.id,
    this.branchId
  });

  int? id;
  int? branchId;

  factory SpaDetailRequest.fromJson( dynamic json) => SpaDetailRequest(
    id: json["id"],
    branchId: json["branchId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id != null ? id : null,
    "branchId": branchId,
  };
}