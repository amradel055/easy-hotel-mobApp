import 'dart:io';

import 'package:easy_hotel/app/core/utils/show_popup_text.dart';
import 'package:easy_hotel/app/core/utils/user_manager.dart';
import 'package:easy_hotel/app/core/values/app_constants.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/orders_detail_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/request/review_request.dart';
import 'package:easy_hotel/app/data/model/setting/dto/response/orders_response_dto.dart';
import 'package:easy_hotel/app/data/repository/setting/setting_repository.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class MyOrdersDetailController extends GetxController {
  final stars = 1.obs;
  var comment = TextEditingController();
  final List res = Get.arguments;
  OrdersResponse? orderDetail;
  final isLoading = false.obs;
  final reviewLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getOrdersDetail();
  }

  getOrdersDetail() async {
    isLoading(true);
    final request = OrdersDetailRequestDto(id: res[0], appId: res[1]);
    SettingRepository().getOrdersDetail(request,
        onSuccess: (data) {
          orderDetail = data.data;
          comment.text = orderDetail?.reviewText ?? "";
          stars(orderDetail?.rate?.toInt() ?? 0);
        },
        onError: (e) => showPopupText(e.toString()),
        onComplete: () => isLoading(false));
  }

  chnageStars(int selected) {
    stars(selected);
  }

  saveReview() {
    reviewLoading(true);
    final request = ReviewRequestDto(
        detailId: orderDetail!.id,
        invOrganizationId: UserManager().user!.id!,
        branchId: orderDetail!.branchId ?? 232,
        createdBy: AppConstants.createdBy,
        companyId: AppConstants.companyId,
        reviewId: orderDetail!.reviewId,
        id: orderDetail!.reviewId,
        itemId: orderDetail!.itemId,
        reviewText: comment.text,
        rate: stars.value,
        appId: orderDetail!.appId);
    SettingRepository().saveReview(request,
        onComplete: () => reviewLoading(false),
        onError: (e) => showPopupText(e),
        onSuccess: (data) {
          Get.back();
          getOrdersDetail();
        });
  }
//   print() async {
//     // Create a new PDF document.
//     final PdfDocument document = PdfDocument();
// // Add a new page to the document.
//     final PdfPage page = document.pages.add();
// // Create a PDF ordered list.
//     final PdfOrderedList orderedList = PdfOrderedList(
//         items: PdfListItemCollection(<String>[
//           'Mammals',
//           'Reptiles',
//           'Birds',
//           'Insects',
//           'Aquatic Animals'
//         ]),
//         marker: PdfOrderedMarker(
//             style: PdfNumberStyle.numeric,
//             font: PdfStandardFont(PdfFontFamily.helvetica, 12)),
//         markerHierarchy: true,
//         format: PdfStringFormat(lineSpacing: 10),
//         textIndent: 10);
// // Create a un ordered list and add it as a sublist.
//     orderedList.items[0].subList = PdfUnorderedList(
//         marker: PdfUnorderedMarker(
//             font: PdfStandardFont(PdfFontFamily.helvetica, 10),
//             style: PdfUnorderedMarkerStyle.disk),
//         items: PdfListItemCollection(<String>[
//           'body covered by hair or fur',
//           'warm-blooded',
//           'have a backbone',
//           'produce milk',
//           'Examples'
//         ]),
//         textIndent: 10,
//         indent: 20);
// // Draw the list to the PDF page.
//     orderedList.draw(
//         page: page,
//         bounds: Rect.fromLTWH(
//             0, 0, page.getClientSize().width, page.getClientSize().height));
// // Save the document.
//     File('BulletandList.pdf').writeAsBytes(await document.save());
// // Dispose the document.
//     document.dispose();
//   }
//   Future<Uint8List> makePdf(Invoice invoice) async {
//     final pdf = Document();
//     pdf.addPage(
//         Page(
//             build: (context) {
//               return Column(
//                   children: []
//               }
//         );
//     }

}
