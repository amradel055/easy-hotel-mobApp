import 'package:easy_hotel/app/core/utils/show_popup_text.dart';

import '../../data/model/restaurant/dto/response/item_response.dart';
import 'app_storage.dart';

class RestaurantStorage {
  static const FAV_ITEMS = "FAV_ITEMS";

  static addItemToFavorite(ItemResponse room) async {
    List<ItemResponse> favList =
        ItemResponse.fromList(await AppStorage.read(FAV_ITEMS) ?? []);
    int index = favList.indexWhere((element) => element.id == room.id);
    if (index != -1) {
      favList.removeAt(index);
      showPopupText("تم مسح الصنف نبجاح من المفضلة");
    } else {
      favList.add(room);
      showPopupText("تم اضافة الصنف بنجاح للمفضلة");
    }
    AppStorage.write(FAV_ITEMS, List.from(favList.map((e) => e.toJson())));
  }

  static Future<bool> isFavItem(int id) async {
    List<ItemResponse> favList =
        ItemResponse.fromList(await AppStorage.read(FAV_ITEMS) ?? []);
    int index = favList.indexWhere((element) => element.id == id);
    return Future.value(index != -1);
  }

  static Future<List<int>> getFavoriteItems() async {
    List<int> favList = await (AppStorage.read(FAV_ITEMS) ?? []);
    return Future.value(favList);
  }
}
