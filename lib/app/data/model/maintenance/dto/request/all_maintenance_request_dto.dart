class AllMaintenanceRequest {
  AllMaintenanceRequest({
    required this.appId,
  });

  int appId;

  factory AllMaintenanceRequest.fromJson(Map<String, dynamic> json) => AllMaintenanceRequest(
    appId: json["appId"],
  );

  Map<String, dynamic> toJson() => {
    "appId": appId,
  };
}