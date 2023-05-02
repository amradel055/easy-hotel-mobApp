class RoomRequestByNumber {
  final int serial;
  final int branchId;

  const RoomRequestByNumber({required this.serial, required this.branchId});

  Map<String, dynamic> toJson() => {"serial": serial, "branchId": branchId};
}
