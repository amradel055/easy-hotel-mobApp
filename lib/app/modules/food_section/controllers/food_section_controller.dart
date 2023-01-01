import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/request/group_items_request.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_mini_response.dart';
import 'package:get/get.dart';

import '../../../data/model/restaurant/dto/group_selected_dto.dart';
import '../../../data/model/restaurant/dto/response/group_response.dart';
import '../../../data/repository/restaurant/restaurant_repository.dart';

class FoodSectionController extends GetxController {
  final GroupSelectedDTO groupSelectedDTO = Get.arguments ;
  final groupItems = <ItemMiniResponse>[].obs ;
  Rxn<GroupResponse> group  = Rxn();
  final groupsList = <GroupResponse>[].obs ;
  final loading = false.obs;
  @override
  void onInit() {
    group.value = groupSelectedDTO.selectedGroups ;
    groupsList(groupSelectedDTO.groupList) ;
    super.onInit();
    getGroupItems();
  }

  onGroupSelected(GroupResponse selectedGroup){
    if(selectedGroup == group.value){
      return ;
    }
    group.value = selectedGroup;
    getGroupItems();
  }


  getGroupItems(){
    loading(true);
    final request = GroupItemsRequest(groupId: group.value!.id!, currencySerial: 1);
    RestaurantRepository().getGroupItemsList(request ,
      onSuccess: (data) => groupItems.assignAll(data.data),
      onError: (e)=> showPopupText(e),
      onComplete: ()=> loading(false)
    );
  }




}
