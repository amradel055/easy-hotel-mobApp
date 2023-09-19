import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/request/group_items_request.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/request/group_request.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_mini_response.dart';
import 'package:get/get.dart';

import '../../../core/utils/res_cart_manager.dart';
import '../../../core/utils/restaurant_strorage.dart';
import '../../../data/model/restaurant/dto/group_selected_dto.dart';
import '../../../data/model/restaurant/dto/response/group_response.dart';
import '../../../data/model/restaurant/dto/response/item_response.dart';
import '../../../data/repository/restaurant/restaurant_repository.dart';

class FoodSectionController extends GetxController {
  // final GroupSelectedDTO groupSelectedDTO = Get.arguments ;
  final groupItems = <ItemMiniResponse>[].obs ;
  Rxn<GroupResponse> group  = Rxn();
  final groupsList = <GroupResponse>[].obs ;
  final loading = false.obs;
  // final groupListRes = <GroupResponse>[].obs;
  final groupLoading = false.obs ;

  @override
  void onInit() {
    getGroupList();
    // if(groupsList.isNotEmpty){
    //   group.value = groupsList[0] ;
    //
    // }
    getGroupItems();



    // groupsList(groupListRes) ;
    super.onInit();


  }

  onGroupSelected(GroupResponse selectedGroup){
    if(selectedGroup == group.value){
      return ;
    }
    group.value = selectedGroup;
    getGroupItems();
  }

  getGroupList(){
    groupLoading(true);
    final request = GroupRequest(
      appId: 1 ,
      branchId:UserManager().selectedBranch!.id!,
    );
    RestaurantRepository().getGroupList(
        request,
        onComplete: () => groupLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          groupsList.assignAll(data.data);

          group.value = data.data[0] ;

  }
    );
  }

  getGroupItems(){
    loading(true);
    final request = GroupItemsRequest(groupId:group.value!=null? group.value!.id:0, currencySerial: 1);
    RestaurantRepository().getGroupItemsList(request ,
      onSuccess: (data)async {
        for(int i= 0 ; i < (data.data?.length ?? 0) ; i++){
            await RestaurantStorage.isFavItem(data.data![i].id ?? -1)
              .then((value) => data.data![i].isFav!(value));
        }
        groupItems.assignAll(data.data ?? []) ;
      } ,
      onError: (e)=> showPopupText(e),
      onComplete: ()=> loading(false)
    );
  }

  addTocart(ItemMiniResponse item)=> {
      RestaurantCartManager().addToCart(ItemResponse(
        fav: item.isFav ?? false.obs ,
         id: item.id ,
         name: item.name,
         time: item.time
         ))
  };



}
