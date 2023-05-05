import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key, required this.image, required this.name, required this.comment, required this.date , required this.reviewStars}) : super(key: key);
  final String? image;
  final String? name ;
  final String? comment;
  final String? date;
  final double? reviewStars ;


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.fromLTRB(0,0,0,size.height*.01),
      child: Container(
        width: size.width*.9,
        decoration: const BoxDecoration( border: Border(bottom: BorderSide(color: AppColors.appHallsRedDark))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    ApiProvider.imageUrl +  (image ?? "")),
                  radius: 33.00,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*.04),
                child: SizedBox(
                  width: size.width*.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(name ?? "",weight: FontWeight.bold , size: 15,),
                      RatingBar.builder(
                        initialRating: reviewStars ?? 0 ,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15.0,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) =>const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                        },
                      ),
                      TextWidget(comment ?? '' , size: 16, weight: FontWeight.w600,),

                    ],
                  ),
                ),
              ), Padding(
                padding:  EdgeInsets.fromLTRB(0, 0, size.width*0,0),
                child: TextWidget(date ?? "",weight: FontWeight.bold),
              ),

            ],
          ),
        ),
      ),
    );
    ;

  }
}