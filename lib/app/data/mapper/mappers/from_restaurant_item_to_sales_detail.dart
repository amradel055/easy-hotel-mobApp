
part of '../mapper.dart';


SalesDetails _fromProductToSalesDetails(ItemResponse product) {
  SalesDetails details = SalesDetails();
  details.productReference = product;
  details.price = product.price;
  details.salePrice = product.salePrice;
  details.quantity = double.parse(product.quantity!.toString());
  details.resOfferId = product.offerId;
  details.name = product.name;
  details.groupId = product.groupId;
  details.net = details.price! * details.quantity!;
  details.itemId = product.id;
  details.discountType = product.discountType;
  details.discountRate = product.discountRate;
  details.discountValue = product.discountValue;
  details.resItemVariation = product.selectedVariation?.id;
  details.resSalesDetailsAdditionsDTOList = product.resSalesDetailsAdditionsDTOList;
  details.appId = product.appId;
  details.remark = product.remark;
  details.createdDate = DateTime.now();
  // details.createdBy = UserManager().user!.id;
  // details.inventoryId = user.inventoryId;
  details.resSalesDetailsAttributeDTOList = product.chooseValues.map((e) => e.toDetailsAttribute).toList();
  details.resSalesDetailsAdditionsDTOList = product.addititonsList!.where((element) => element.selected!).map((e) => e.toSalesDetailsAddition).toList();
  return details;
}