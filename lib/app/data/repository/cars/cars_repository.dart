


import 'package:easy_hotel/app/data/model/cars/dto/request/cars_groups_request_dto.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_order_request.dart';
import 'package:easy_hotel/app/data/model/cars/dto/request/cars_request_dto.dart';
import 'package:easy_hotel/app/data/model/cars/dto/response/cars_groups_response_dto.dart';
import '../../model/cars/dto/request/cars_price_request.dart';
import '../../model/cars/dto/request/cars_traffic_line_request_dto.dart';
import '../../model/cars/dto/response/cars_price_response.dart';
import '../../model/cars/dto/response/cars_response_dto.dart';
import '../../model/cars/dto/response/cars_traffic_lines_response.dart';
import '../../provider/api_provider.dart';

class CarsRepository {

  getCarsGroup(
      CarsGroupRequest carsGroupRequest, {
        Function()? onComplete,
        SuccessFunc<List<CarsGroupsResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CarsGroupsResponse>>('Cars/mainGroups',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: carsGroupRequest.toJson(),
        onError: onError,
        convertor: CarsGroupsResponse.fromList,
      );

  getCarsOfGroup(
      CarsRequest carsRequest, {
        Function()? onComplete,
        SuccessFunc<List<CarsResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CarsResponse>>('Cars/groupItems',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: carsRequest.toJson(),
        onError: onError,
        convertor: CarsResponse.fromList,
      );

  getAllTrafficLines(
      CarsTrafficLinesRequest carsTrafficLinesRequest, {
        Function()? onComplete,
        SuccessFunc<List<CarsTrafficLinesResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CarsTrafficLinesResponse>>('Cars/findAllTraficLines',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: carsTrafficLinesRequest.toJson(),
        onError: onError,
        convertor: CarsTrafficLinesResponse.fromList,
      );


      getCarPrice(
      CarsPriceRequest request, {
        Function()? onComplete,
        SuccessFunc<CarsPriceResponse?> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<CarsPriceResponse?>('Cars/getPriceForTrafficLine',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor:CarsPriceResponse.fromJson,
      );

  saveCarsOrder(
        CarsOrderRequest carsOrderRequest, {
        Function()? onComplete,
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<void>('Cars/save',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: carsOrderRequest.toJson(),
        onError: onError,
        convertor: (json){},
      );

}