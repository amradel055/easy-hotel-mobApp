// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

import '../../data/model/rooms/dto/response/room_response.dart';

abstract class AppStorage {
  static final _getStorage = GetStorage();

  //region Keys

  static const DARK_MODE_KEY = 'DARK_MODE_KEY';
  static const TOKEN_KEY = 'TOKEN_KEY';
  static const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN_KEY';
  static const USER = 'USER';
  static const IS_LOGGED_IN = "IS_LOGGED_IN";
  static const RATING_LIST ="RATING_LIST";
  static const NOTIFICATION_SETTINGS = "NOTIFICATION_SETTINGS";
  static const TOKEN_EXPIRE_TIME_KEY = "TOKEN_EXPIRE_TIME_KEY";
  static const LANGUAGE_KEY = "LANGUAGE_KEY";
  static const CART = "CART";
  static const SELECTED_BRANCH = "SELECTED_BRANCH";
  static const FAV_ROOMS = "FAV_ROOMS";

  static bool get getNotificationSetting => read<bool>(NOTIFICATION_SETTINGS) ?? true;

  //endregion

  static T? read<T>(String key) => _getStorage.read<T>(key);

  static Future write<T>(String key, T value) => _getStorage.write(key, value);

  static Future remove(String key) => GetStorage().remove(key);

  static Future removeAll() => GetStorage().erase();

  static Map<String,double> get _getRatingValues => Map<String,double>.from(read(RATING_LIST) ?? {});

  static saveRatingValue(String profileId, double rate){
    final map = _getRatingValues..[profileId] = rate;
    write(RATING_LIST, map);
  }

  static addRoomToFavorite(RoomResponse room)async{
   List<RoomResponse> favList = RoomResponse.fromList(await read(FAV_ROOMS) ?? []);
   int index = favList.indexWhere((element) => element.id == room.id);
   if(index != -1){
        favList.removeAt(index);
   }else{
   favList.add(room);
   }
   write(FAV_ROOMS, List.from(favList.map((e) => e.toJson())));
  }

  static Future<bool> isFavRoom(int id)async{
   List<RoomResponse> favList = RoomResponse.fromList(await read(FAV_ROOMS) ?? []);
   int index = favList.indexWhere((element) => element.id == id);
   return Future.value(index != -1) ;
  }

  static Future<List<int>> getFavoriteRooms()async{
   List<int> favList = await(read(FAV_ROOMS) ?? []);
   return Future.value(favList) ;
  }

  static double? getRatingValue(String profileId){
    return _getRatingValues[profileId];
  }

  static Future saveNotificationSettings(bool value) {
    return write(NOTIFICATION_SETTINGS, value);
  }

}
