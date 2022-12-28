import '../../model/restaurant/dto/request/group_items_request.dart';
import '../../model/restaurant/dto/request/group_request.dart';
import '../../model/restaurant/dto/request/offers_request.dart';
import '../../model/restaurant/dto/request/slider_request.dart';
import '../../model/restaurant/dto/response/group_response.dart';
import '../../model/restaurant/dto/response/item_mini_response.dart';
import '../../model/restaurant/dto/response/slider_response.dart';
import '../../provider/api_provider.dart';

class RestaurantRepository {
  getSliders(
    SlidersRequest slidersRequest, {
    SuccessFunc<List<SlidersResponse>> onSuccess,
    Function(dynamic error)? onError,
    Function()? onComplete,
  }) {
    ApiProvider().post<List<SlidersResponse>>('restaurantMain/slidersMobile',
        onSuccess: onSuccess,
        data: slidersRequest.toJson(),
        onError: onError,
        convertor: SlidersResponse.fromList,
        onComplete: onComplete);
  }

  getOfferList(
    OffersRequest request, {
    SuccessFunc<List<ItemMiniResponse>> onSuccess,
    Function(dynamic error)? onError,
    Function()? onComplete,
  }) {
    ApiProvider().post<List<ItemMiniResponse>>('restaurantMain/offersMobile',
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor: ItemMiniResponse.fromList,
        onComplete: onComplete);
  }


  getGroupList(
      GroupRequest request, {
        SuccessFunc<List<GroupResponse>> onSuccess,
        Function(dynamic error)? onError,
        Function()? onComplete,
      }) {
    ApiProvider().post<List<GroupResponse>>('restaurantMain/mainGroupsMobile',
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor: GroupResponse.fromList,
        onComplete: onComplete);
  }

  getGroupItemsList(
      GroupItemsRequest request, {
        SuccessFunc<List<ItemMiniResponse>> onSuccess,
        Function(dynamic error)? onError,
        Function()? onComplete,
      }) {
    ApiProvider().post<List<ItemMiniResponse>>('restaurantGroup/groupItemsMobile',
        onSuccess: onSuccess,
        data: request.toJson(),
        onError: onError,
        convertor: ItemMiniResponse.fromList,
        onComplete: onComplete);
  }


}
