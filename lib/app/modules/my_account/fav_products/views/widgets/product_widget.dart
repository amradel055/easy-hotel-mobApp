import 'package:easy_hotel/app/core/utils/products_fav_manager.dart';
import 'package:easy_hotel/app/data/model/restaurant/dto/response/item_response.dart';
import 'package:easy_hotel/app/data/model/rooms/dto/response/room_response.dart';
import 'package:easy_hotel/app/data/model/setting/dto/response/product_model.dart';
import 'package:easy_hotel/app/modules/my_account/fav_products/controllers/fav_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';

import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  Size size;
  String? quantity;
  String? name;
  String? discribtion;
  num? price;
  num? salePrice;
  int? appId;
  bool fav;
  VoidCallback? onDeletePressed;
  VoidCallback? onTap;
  bool cartProduct;

  bool? saleItem;

  ProductCard(
      this.size,
      this.fav,
      this.quantity,

      this.cartProduct,
 
      {Key? key , this.appId,
      this.discribtion,
      this.name,
      this.price,
      this.onDeletePressed,
      this.saleItem,
      this.onTap,
      this.salePrice,})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
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
                        widget.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.width * 0.05),
                      ),
                      Text(widget.discribtion!,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w700)),
                      (widget.saleItem) == false
                          ? Text(
                              "${widget.price}LE",
                              style:
                                  TextStyle(fontSize: widget.size.width * 0.045),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.price!}LE",
                                  style: TextStyle(
                                      fontSize: widget.size.width * 0.045,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${widget.salePrice!}LE",
                                      style: TextStyle(
                                          fontSize: widget.size.width * 0.045),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: widget.size.width * 0.15,
                                        height: widget.size.height * 0.04,
                                        color: Colors.red.shade400,
                                        child: Center(
                                            child: Text(
                                          "Sale ${(((widget.price! - widget.salePrice!) / widget.price!) * 100).toStringAsFixed(0)} %",
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
                      widget.quantity != null
                          ? Text(
                              "Quantity : ${widget.quantity}",
                              style:
                                  TextStyle(fontSize: widget.size.width * 0.045),
                            )
                          : const SizedBox()
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
                          onPressed: widget.onDeletePressed,
                          icon: Icon(
                            widget.fav ? Icons.favorite : Icons.favorite_border,
                            size: widget.size.width * 0.07,
                          )),
                      // widget.cartProduct
                      //     ? IconButton(
                      //         onPressed: widget.onDeletePressed,
                      //         icon: Icon(
                      //           Icons.delete,
                      //           size: widget.size.width * 0.07,
                      //           color: Colors.red,
                      //         ))
                      //     : IconButton(
                      //         onPressed: () {
                      //           // FavProductsManager().addProduct(widget.product!, context);
                      //         },
                      //         icon: Icon(
                      //           Icons.add_shopping_cart,
                      //           size: widget.size.width * 0.07,
                      //           color: Colors.black,
                      //         )),
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
                        "/restaurantItem/itemImage/" + "widget.product!.image!",
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
