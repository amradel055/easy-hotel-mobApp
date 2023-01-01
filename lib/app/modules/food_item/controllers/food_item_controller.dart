import 'dart:convert';
import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/data/repository/restaurant/restaurant_repository.dart';
import 'package:get/get.dart';
import '../../../data/model/restaurant/dto/request/group_items_request.dart';
import '../../../data/model/restaurant/dto/request/item_request.dart';
import '../../../data/model/restaurant/dto/response/attribute_details_model.dart';
import '../../../data/model/restaurant/dto/response/attribute_model.dart';
import '../../../data/model/restaurant/dto/response/item_mini_response.dart';
import '../../../data/model/restaurant/dto/response/item_response.dart';
import '../../../data/model/restaurant/dto/response/variation_model.dart';

class FoodItemController extends GetxController {
  final count = 1.obs;
  final itemId = Get.arguments ;
  final loading = false.obs ;
  Rxn<Variation> selectedVariation = Rxn();
  Rxn<ItemResponse> pro = Rxn();
  final attributeList = <Attribute>[].obs;
  void increment() => count.value++;
  void decrement() => count.value>1?count.value--:null;
  final selectedAdditions = <Additions>[].obs ;
  final groupItems = <ItemMiniResponse>[].obs ;


  @override
  void onInit() async{
   await getItem();
   await getGroupItems();
    super.onInit();
  }

  getGroupItems(){
    loading(true);
    final request = GroupItemsRequest(groupId:pro.value!.groupId ?? 393 , currencySerial: 1);
    RestaurantRepository().getGroupItemsList(request ,
        onSuccess: (data) => groupItems.assignAll(data.data),
        onError: (e)=> showPopupText(e),
        onComplete: ()=> loading(false)
    );
  }

  changeAddition(Additions selected){
    if(selectedAdditions.contains(selected)){
      selectedAdditions.remove(selected);
    }else{
      selectedAdditions.add(selected);
    }
  }

  getItem(){
    loading(true);
    final request = ItemRequest(id: itemId , index: 1);
    RestaurantRepository().getItem(
      request,
      onComplete: () =>  loading(false),
      onError: (e) => showPopupText(e),
      onSuccess: (data) {
        pro(data.data);
        pro.value?.itemImages?.add(ImageModel(image: pro.value?.image));
        String list = jsonEncode(pro.value!.attributeList);
        List _list = jsonDecode(list);
        attributeList(List<Attribute>.from(_list.map((e) => Attribute.fromJson(e))));
      }
    );
  }

  onAttributeChanged({required int i, required AttributeDetails term}){
    pro.value!.chooseValues.removeWhere((element) => element.headId == attributeList[i].id);
    pro.value!.chooseValues.add(term);
    // checkVariation(pro!.variationsList!, i);
    checkVariationNew();
  }

  void checkVariationNew(){
    try {
      final product = pro.value ;
      final variations = product!.variationsList!;
      final selectedTerms = product.chooseValues;

      product.selectedVariation = null;
      List<Variation> possibleVariations = List<Variation>.from(variations.map((e) => Variation.fromJson(e.toJson())));
      possibleVariations = possibleVariations.where((variation) => (variation.variationDetails??[]).every((element) => selectedTerms.any((term) => element.attributeDetailsId == term.id))).toList();
      if(possibleVariations.isEmpty){
        possibleVariations = possibleVariations.where((element) => (element.variationDetails??[]).length == 1 && selectedTerms.any((e) => e.id == (element.variationDetails??[]).single.id)).toList();
      }
      product.name = "${product.name!.split("-").first}-${selectedTerms.map((e) => e.value??"").join("-")}";
      if(possibleVariations.isNotEmpty){
        product.price = (possibleVariations.first.price??0).toDouble();
        product.salePrice = (possibleVariations.first.salePrice??0).toDouble();
        product.selectedVariation = possibleVariations.first;
      } else {
        product.price =  product.priceNoAttribute;
        product.salePrice =  product.salePriceNoAttribute;
      }
      pro(product);
      pro.refresh();
    } catch (e,s) {
      print("$e\n$s");
    }
  }
}
