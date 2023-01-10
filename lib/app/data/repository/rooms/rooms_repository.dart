
import 'package:easy_hotel/app/data/model/rooms/dto/request/advertisement_request_dto.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/cities_request_dto.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/offers_rooms_request_dto.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_detail_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_save_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/request/room_search_filter_request.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/advertisement_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/city_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_search_city_response.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_city_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_detail_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/all_spa_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_hotel_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_save_request.dart';
import 'package:easy_hotel/app/data/model/spa/dto/request/spa_search_request_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_city_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_search_response_dto.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';

class RoomsRepository {

  getCities(
      CitiesRequest citiesRequest, {
        Function()? onComplete,
        SuccessFunc<List<CityResponse>> onSuccess,
         Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<CityResponse>>('cities/citiesList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: citiesRequest.toJson(),
        onError: onError,
        convertor: CityResponse.fromList,
      );

  getRoomsOffer(
      OffersRoomsRequest offersRoomsRequest, {
        Function()? onComplete,
        SuccessFunc<List<RoomResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<RoomResponse>>('rooms/offersRoomList',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: offersRoomsRequest.toJson(),
        onError: onError,
        convertor: RoomResponse.fromList,
      );

  getRoomsAds(
      AdvertisementRequest advertisementRequest, {
        Function()? onComplete,
        SuccessFunc<List<AdvertisementResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<AdvertisementResponse>>('slider/SliderForHotel',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: advertisementRequest.toJson(),
        onError: onError,
        convertor: AdvertisementResponse.fromList,
      );

  getRoomsDiscover(
      AdvertisementRequest advertisementRequest, {
        Function()? onComplete,
        SuccessFunc<List<AdvertisementResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<AdvertisementResponse>>('slider/SliderForHotel',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: advertisementRequest.toJson(),
        onError: onError,
        convertor: AdvertisementResponse.fromList,
      );



  getRoomsSearch(
      SpaSearchRequest spaSearchRequest, {
        SuccessFunc<SpaSearchResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<SpaSearchResponse>(
        'branch/searchListApi',
        onSuccess: onSuccess,
        data: spaSearchRequest.toJson(),
        onError: onError,
        convertor: SpaSearchResponse.fromJson,
        onComplete: onComplete
    );
  }


  getCityRooms(
      RoomSearchFilterRequest roomSearchFilterRequest, {
        Function()? onComplete,
        SuccessFunc<List<RoomcityResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<RoomcityResponse>>('rooms/findRoomsByFiltterData',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: roomSearchFilterRequest.toJson(),
        onError: onError,
        convertor: RoomcityResponse.fromList,
      );

  getHotelRooms(
      RoomSearchFilterRequest roomSearchFilterRequest, {
        Function()? onComplete,
        SuccessFunc<List<RoomcityResponse>> onSuccess,
        Function(dynamic error)? onError,
      }) =>
      ApiProvider().post<List<RoomcityResponse>>('rooms/findRoomsByCittId',
        onComplete: onComplete,
        onSuccess: onSuccess,
        data: roomSearchFilterRequest.toJson(),
        onError: onError,
        convertor: RoomcityResponse.fromList,
      );

  getRoomDetail(
      RoomDetailRequest roomDetailRequest, {
        SuccessFunc<RoomResponse> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<RoomResponse>(
        'rooms/FindRoomDto',
        onSuccess: onSuccess,
        data: roomDetailRequest.toJson(),
        onError: onError,
        convertor: RoomResponse.fromJson,
        onComplete: onComplete
    );
  }

  getRoomSave(
      RoomsSaveRequest roomsSaveRequest, {
        SuccessFunc<void> onSuccess,
        Function(dynamic error)? onError,  Function()?onComplete,
      }) {
    ApiProvider().post<void>(
        'rooms/save',
        onSuccess: onSuccess,
        data: roomsSaveRequest.toJson(),
        onError: onError,
        convertor: (_){return null;},
        onComplete: onComplete
    );
  }

}
