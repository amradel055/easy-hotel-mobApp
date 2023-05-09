import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/controllers/fav_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../core/values/app_colors.dart';

class ProductCard extends StatefulWidget {
  Size size;

  ItemResponse? product;

  String? quantity;

  RxBool fav;

  VoidCallback? onDeletePressed;

  bool cartProduct;

  ProductCard(this.size, this.product, this.fav, this.quantity,
      this.onDeletePressed, this.cartProduct,
      {Key? key})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // final favController = Get.find<FavProductsController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
          width: widget.size.width,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: widget.size.height * .001, color: Colors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widget.size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product!.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: widget.size.width * 0.05),
                    ),
                    Text(
                      widget.product!.discribtion ?? "",
                      style: TextStyle(fontSize: widget.size.width * 0.04),
                    ),
                    (widget.product?.saleItem ?? false) == false
                        ? TextWidget(
                            "${(widget.product?.sumPrice ?? 0) > 0 ? widget.product?.sumPrice : widget.product?.price ?? "0"} ${UserManager().selectedBranch?.currencyName ?? AppStrings.LE}",
                            size: widget.size.width * 0.045,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                "${widget.product?.price ?? "0"} ${UserManager().selectedBranch?.currencyName ?? AppStrings.LE}",
                                size: widget.size.width * 0.045,
                                showInline: true,
                                textColor: Colors.grey,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    "${widget.product?.salePrice ?? "0"} ${UserManager().selectedBranch?.currencyName ?? AppStrings.LE}",
                                    size: widget.size.width * 0.045,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: widget.size.width * 0.15,
                                      height: widget.size.height * 0.04,
                                      color: Colors.red.shade400,
                                      child: Center(
                                          child: Text(
                                        "Sale ${(((widget.product?.price ?? 0 - (widget.product?.salePrice ?? 0)) / (widget.product?.price ?? 0)) * 100).toStringAsFixed(0)} %",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: widget.size.width * 0.032,
                                            color: Colors.white),
                                      )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                    TextWidget(
                      " ${widget.product?.time ?? ""} ",
                      size: widget.size.width * 0.04,
                      children: [
                        TextWidget(
                          AppStrings.minutes,
                          size: widget.size.width * 0.04,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: AppColors.restaurantThirdColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                alignment: Alignment.center,
                                icon: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Icon(Icons.minimize),
                                ),
                                onPressed: () => widget.product!.quantity! > 1
                                    ? setState(() {
                                        widget.product!.quantity != null
                                            ? widget.product!.quantity =
                                                widget.product!.quantity! - 1
                                            : null;
                                        widget.product!.calcSumPrice();
                                      })
                                    : null,
                              )),
                        ),
                        Text(
                          "${widget.product?.quantity ?? 1}",
                          style: TextStyle(
                              fontSize: widget.size.width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: AppColors.restaurantThirdColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => setState(() {
                                  widget.product!.quantity != null
                                      ? widget.product!.quantity =
                                          widget.product!.quantity! + 1
                                      : null;
                                  widget.product!.calcSumPrice();
                                }),
                              ))),
                        ),
                                                Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                alignment: Alignment.center,
                                icon: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Icon(Icons.note_add),
                                ),
                                onPressed: (){
                                  Get.dialog(Dialog(
                                    child: Container(
                                      color: Colors.white,
                                      height: widget.size.height * 0.2,
                                      width: widget.size.width * 0.8,
                                      child: TextFormField(
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                          hintText: "!اضف ملاحظتك"
                                        ),
                                        onChanged: (val) => setState(() {
                                          widget.product!.remark = val ;
                                        }),
                                      ),
                                    ),

                                  ));
                                },
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (widget.fav.value) {
                            // favController.remove(widget.product!.id!, context);
                          } else {
                            // favController.addProduct(widget.product!, context);
                          }
                          setState(() {
                            widget.fav.value = !widget.fav.value;
                          });
                        },
                        icon: Icon(
                          widget.fav.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: widget.size.width * 0.07,
                        )),
                    widget.cartProduct
                        ? IconButton(
                            onPressed: widget.onDeletePressed,
                            icon: Icon(
                              Icons.delete,
                              size: widget.size.width * 0.07,
                              color: Colors.red,
                            ))
                        : IconButton(
                            onPressed: () {
                              // favController.addProduct(widget.product!, context);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: widget.size.width * 0.07,
                              color: Colors.black,
                            )),
                  ],
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.3,
                height: widget.size.height * 0.12,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder:
                        const AssetImage("assets/images/placeholder.jpeg"),
                    image: NetworkImage(
                      ApiProvider.imageUrl + (widget.product?.image ?? ""),
                    )),
              ),
            ],
          )),
    );
  }
}
