import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/data/model/setting/dto/response/orders_response_dto.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';


class PrintingHelper {
  void printInvoice(m.BuildContext context, OrdersResponse order,
     ) async {
    // LoginData? user = context.read<AuthProvider>().user ;
    final doc = Document();
    const PdfColor grey = PdfColors.grey400;
    final font = await rootBundle.load("assets/fonts/Cairo-Bold.ttf");
    final fontLight = await rootBundle.load("assets/fonts/Cairo-Light.ttf");
    final ttfBold = Font.ttf(font);
    final ttfLight = Font.ttf(fontLight);
    final normalStyle = TextStyle(font: ttfLight, fontSize: 9);
    final boldStyle = TextStyle(font: ttfBold, fontSize: 11, fontBold: ttfBold);
    final boldStyle2 = TextStyle(font: ttfBold, fontSize: 9, fontBold: ttfBold);
    // final dm = Barcode.dataMatrix();
    //
    // final svg = dm.toSvg('114625', width: 80, height: 25);
    // final List<int> bytes = svg.codeUnits;
    // final im.Image? image = im.decodePng(bytes);
    doc.addPage(MultiPage(
      // header: (_) => Container(
      //     height: 25,
      //     decoration: const BoxDecoration(),
      //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //       Text(
      //         DateTime.now().toIso8601String().split("T")[0],
      //         style: boldStyle,
      //         textDirection: TextDirection.rtl,
      //       ),
      //       Text(
      //         context.read<AuthProvider>().userModel!.data!.name!,
      //         style: boldStyle,
      //         textDirection: TextDirection.rtl,
      //       ),
      //     ])),
        pageTheme: const PageTheme(pageFormat: PdfPageFormat.a4, textDirection: TextDirection.rtl),
        build: (Context context) {
          return [

            SizedBox(height: 50.5),
            SizedBox(
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      order.name.toString(),
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      "تفاصيل الطلب ",
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ])),

            SizedBox(height: 20.5),
            SizedBox(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //customer data and date
                  SizedBox(
                      width: 120,
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            DateFormat("dd/MM/yyyy hh:mm aa").format(order.date!),
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "التاريخ",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            order.serial.toString(),
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "رقم الخدمه",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            order.cost.toString(),
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "اجمالي السعر ",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                      ])),
                  //barcode widget
                  // SizedBox(
                  //     width: 130,
                  //     height: 50,
                  //     child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  //       Container(
                  //           width: 80,
                  //           height: 25,
                  //           child: BarcodeWidget(
                  //             height: 25,
                  //             width: 80,
                  //             color: PdfColor.fromHex("#000000"),
                  //             barcode: Barcode.fromType(BarcodeType.Codabar),
                  //             drawText: false,
                  //             data: invoiceModel.name.toString(),
                  //           ))
                  //     ])),
                  // seller data
                  SizedBox(
                      width: 180,
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            UserManager().user!.name!,
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Spacer(),
                          Text(
                            "اسم العميل",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            UserManager().user!.mobile??"لايوجد",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Spacer(),
                          Text(
                            "رقم الهاتف",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                         order.name!,
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Spacer(),
                          Text(
                            "اسم الخدمه",
                            style: boldStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ]),
                        // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        //   Text(
                        //     invoiceModel.dueDate == null ? "" : DateFormat("dd/MM/yyyy").format(invoiceModel.dueDate!),
                        //     style: boldStyle,
                        //     textDirection: TextDirection.rtl,
                        //   ),
                        //   Spacer(),
                        //   Text(
                        //     "تاريخ التسليم",
                        //     style: boldStyle,
                        //     textDirection: TextDirection.rtl,
                        //   ),
                        // ]),
                      ])),
                ])),
            SizedBox(height: 15),
            // m.LayoutBuilder(
            //   builder: (context, c){
            //     return Text(c?.maxWidth.toString()??"");
            //   }
            // ),
            //table headers
            // Table(border: TableBorder.all(width: 1), tableWidth: TableWidth.max, children: [
            //   TableRow(children: [
            //     Container(
            //         color: grey,
            //         width: 55,
            //         child: Center(
            //             child: Text(
            //               "القيمة",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 45,
            //         child: Center(
            //             child: Text(
            //               "الخصم",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 55,
            //         child: Center(
            //             child: Text(
            //               "السعر",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 60,
            //         child: Center(
            //             child: Text(
            //               "مستودع",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 40,
            //         child: Center(
            //             child: Text(
            //               "كمية",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 40,
            //         child: Center(
            //             child: Text(
            //               "العدد",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 50,
            //         child: Center(
            //             child: Text(
            //               "الوحدة",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 160,
            //         child: Center(
            //             child: Text(
            //               "اسم الصنف",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 70,
            //         child: Center(
            //             child: Text(
            //               "رقم الصنف",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //     Container(
            //         color: grey,
            //         width: 30,
            //         child: Center(
            //             child: Text(
            //               "م",
            //               style: boldStyle,
            //               textDirection: TextDirection.rtl,
            //             ))),
            //   ]),
            //   //table content
            //   for (int i = 0; i < invoiceModel.invoiceDetailApiList!.length; i++)
            //     TableRow(children: [
            //       Container(
            //           width: 55,
            //           child: Center(
            //               child: Text(
            //                 (invoiceModel.invoiceDetailApiList![i].net ?? 0).toStringAsFixed(2),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 45,
            //           child: Center(
            //               child: Text(
            //                 (invoiceModel.invoiceDetailApiList![i].discount ?? 0).toStringAsFixed(2),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 55,
            //           child: Center(
            //               child: Text(
            //                 (invoiceModel.invoiceDetailApiList![i].price ?? 0).toStringAsFixed(2),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 60,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].inventoryCode.toString(),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 40,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].quantity?.toStringAsFixed(2) ?? '',
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 40,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].number.toString(),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 50,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].unitName.toString(),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 160,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].name.toString(),
            //                 style: boldStyle2,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 70,
            //           child: Center(
            //               child: Text(
            //                 invoiceModel.invoiceDetailApiList![i].code.toString(),
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //       Container(
            //           width: 30,
            //           child: Center(
            //               child: Text(
            //                 "${i + 1}",
            //                 style: boldStyle,
            //                 textAlign: TextAlign.center,
            //                 textDirection: TextDirection.rtl,
            //               ))),
            //     ]),
            // ]),
            SizedBox(height: 5),
            order.addtionsDTOList!.isNotEmpty?  SizedBox(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                      width: 500,
                      child: Table(tableWidth: TableWidth.max, border: TableBorder.all(width: 0.5), children: [
                        TableRow(children: [
                          SizedBox(
                              width: 30,
                              child: Center(
                                  child: Text(
                                 "السعر",
                                    style: boldStyle,
                                    textDirection: TextDirection.rtl,
                                  ))),
                          SizedBox(
                              width: 30,
                              child: Center(
                                  child: Text(
                                    "الاضافه",
                                    style: boldStyle,
                                    textDirection: TextDirection.rtl,
                                  ))),
                        ]),
                        for(int i=0;i<order.addtionsDTOList!.length;i++)

                        TableRow(children: [
                          SizedBox(
                              width: 30,
                              child: Center(
                                  child: Text(
                                    order.addtionsDTOList![i].price!.toString(),
                                    style: boldStyle,
                                    textDirection: TextDirection.rtl,
                                  ))),
                          SizedBox(
                              width: 30,
                              child: Center(
                                  child: Text(
                                    order.addtionsDTOList![i].name!,
                                    style: boldStyle,
                                    textDirection: TextDirection.rtl,
                                  ))),
                        ]),

                      ])),
                ])):SizedBox(

                child: Center(
                    child: Text(
                      "لا اضافات",
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ))),
            order.termsHotelDTO==null?SizedBox():   SizedBox(

                child: Center(
                    child: Text(
                      "الشروط والاحكام",
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ))),
            order.termsHotelDTO==null?SizedBox():  SizedBox(

                child: Center(
                    child: Text(
                      order.termsHotelDTO!.title!,
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ))),
            order.termsHotelDTO==null?SizedBox():    SizedBox(

                child: Center(
                    child: Text(
                      order.termsHotelDTO!.text!,
                      style: boldStyle,
                      textDirection: TextDirection.rtl,
                    ))),
          ];
        }));

    m.showDialog(
        context: context,
        builder: (context) {
          return m.LayoutBuilder(builder: (context, c) {
            return PdfPreview(
              actions: [
                m.IconButton(
                  onPressed: () => m.Navigator.pop(context),
                  icon: const m.Icon(
                    m.Icons.close,
                    color: m.Colors.red,
                  ),
                )
              ],
              build: (format) => doc.save(),
            );
          });
        });
  }


}
