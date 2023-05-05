
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/data/model/spa/dto/response/spa_response_dto.dart';
import 'package:easy_hotel/app/modules/spa/spa_detail/controllers/spa_details_controller.dart';
import 'package:easy_hotel/app/components/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';


class ReviewsListWidget extends StatelessWidget {
  const ReviewsListWidget({Key? key ,
    required this.reviewNumber ,
    required this.reviewStars ,
    required this.reviewsList,
  }) : super(key: key);
  final double? reviewStars ;
  final int? reviewNumber ;
  final List<ReviewModel>? reviewsList ;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(children: [
      Column(children: [
        TextWidget(reviewStars.toString(),weight: FontWeight.w800 , size: 20,),
        RatingBar.builder(
          initialRating: reviewStars ?? 0,
          minRating: 1,
          direction: Axis.horizontal,
          ignoreGestures: true,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
          },
        ),
        SizedBox(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(AppStrings.reviewedBy ,weight: FontWeight.bold),
               Padding(
                 padding: const EdgeInsets.only(left: 8 , right: 8),
                 child: TextWidget(reviewNumber.toString(),weight: FontWeight.bold),
               ),
              const TextWidget(AppStrings.person,weight: FontWeight.bold),
            ],
          ),
        )
      ],
      ),
      SizedBox(
        height: size.height*.5,
        width: size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              for(ReviewModel review in reviewsList ?? [])
                 ReviewWidget(image: '', name: review.customerName ?? "", comment: review.reviewText,
                 date:review.reviewDate != null ? DateFormat("dd-MM-yyyy").format(review.reviewDate!) : "" , reviewStars: review.reviewStars ,)
            ],
          ),
        ),
      ),

    ],);  }

}
