class MaintenanceDetailRequest {
  MaintenanceDetailRequest({
    required this.groupId,
  });

  int groupId;

  factory MaintenanceDetailRequest.fromJson(Map<String, dynamic> json) => MaintenanceDetailRequest(
    groupId: json["groupId"],
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
  };
}