

class CarsPriceRequest {
    final int trafficLineId;
    final int carId;
    final int type;
    final int branchId;
    
   const CarsPriceRequest({required this.branchId , required this.carId,required this.trafficLineId,
   required this.type});


   Map<String , dynamic> toJson() => {
     "trafficLineId" :trafficLineId,
     "carId" :carId,
     "type" :type,
     "branchId" :branchId,
   };

}