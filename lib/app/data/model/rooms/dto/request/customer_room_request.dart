

class CustomerRoomRequest{
    final int id ;
    final int branchId ;

    const CustomerRoomRequest({required this.id , required this.branchId});

    Map<String , dynamic> toJson() => {
       "id" : id,
       "branchId" : branchId
    };
}