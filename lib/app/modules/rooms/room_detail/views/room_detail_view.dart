import 'dart:collection';

import 'package:easy_hotel/app/components/image_widget.dart';
import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_assets.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/core/values/app_strings.dart';
import 'package:easy_hotel/app/modules/halls/hall_detail/views/widgets/hall_services.dart';
import 'package:easy_hotel/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/room_details_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class RoomDetailView extends GetView<RoomDetailController> {
  const RoomDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    bool onshow = true;
    var myMarkers = HashSet<Marker>();
    List<Polyline> myPolilines = [];


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration:const  BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent
                ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 250.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.rooms), fit: BoxFit.cover)),

              padding:  EdgeInsets.fromLTRB(50.h, 120.h,50.h, 20.h),



          ),
          SizedBox(
              height: size.height*.1,
              child:
              ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return   Padding(
                    padding: const EdgeInsets.fromLTRB(1,0,1,0),
                    child: ImageWidget(path: "https://www.arabiaweddings.com/sites/default/files/articles/2020/02/wedding_venues_in_amman.png",radius: 0,width: size.width*.3,height: size.height*.18,fit: BoxFit.fill,),
                  );
                },

              )
          ),
          SizedBox(
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Container(
                          width: size.width * .75,
                          height: size.height * .12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "roomsGroups!.name!",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColors.appBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: Text(
                                        "${"3"}.Star",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "roomsGroups!.branchName!",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "${"222"}LE ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "per day ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Container(
                    width: size.width * .9,
                    child: Text(
                      "تفاصيل الغرفه ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .9,
                    height: size.height * .09,
                    child:
                    GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: size.aspectRatio * 5,
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text("${"3" +' بلكونه'}",),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text("${"3" +' حمام'}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text("${"3" +'سرير'}"),
                        )
                        ,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text("${"3" +'جراج'}"),
                        ),
                        for(int i = 0 ; i <= 1 ; i++)
                          Center(child: Text('قاعة اضافية' )

                          )],
                    ),
                  ),

                  Container(
                    width: size.width * .9,
                    child: Text(
                      "تقييم العملاء",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .65,
                        height: size.height * .12,
                        child: Container(
                          width: size.width * .23,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'النظافه',

                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating:
                                            3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      )),
                                  Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'رضاء العملاء',

                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating:
                                            3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'فريق العمل',

                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating:
                                           3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      )),
                                  Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'التكاليف',

                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating:
                                            3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 10.0,
                                            ignoreGestures: true,
                                            itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          )
                                        ],
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: size.width * .35,
                          child: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            radius: 40,
                            child: CircleAvatar(
                              child: Text(
                               "3",

                              ),
                              backgroundColor: AppColors.appBlue,
                              radius: 32,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: size.width * .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'المكان',

                        ),
                        Container(
                          // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),border: Border.all(color: Colors.red)),
                          height: size.height * .25, width: double.infinity,
                          child: GoogleMap(
                            // mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target:
                              LatLng(37.43296265331129, -122.08832357078792),
                              zoom: size.height * .01,
                            ),
                            onMapCreated:
                                (GoogleMapController googleMapController) {

                            },
                            markers: myMarkers,
                            polylines: myPolilines.toSet(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .9,
                    height: size.height * .002,
                    color: Colors.grey[500],
                  ),
                  // for(int i  =0 ; i<_rooms!.groupRemarkDTOList!.length ;i++)

                  SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ماذا حولك',
                          ),
                          SizedBox(
                            height: onshow ? size.height * .12 : size.height * .3,
                            width: size.width * .9,
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * .9,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // for (RemarkGroupModel remark
                                        // in roomsGroups!.groupRemarkDTOList!)
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                               " remark.name!",
                                              ),
                                              for (int x = 0;
                                              x <
                                                 4;
                                              x++)
                                                Row(
                                                  children: [
                                                    Icon(Icons.ac_unit),
                                                    Text("remark.name!")
                                                  ],
                                                ),
                                            ],
                                          ),
                                      ],
                                      // _rooms!.groupRemarkDTOList![i].remarkDtoListForGroup![i].groupId,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .04,
                            child: TextButton(
                                onPressed: () {

                                },
                                child: Text(onshow ? 'see more' : 'see less')),
                          )
                        ],
                      )),
                  Container(
                    width: size.width * .9,
                    height: size.height * .002,
                    color: Colors.grey[500],
                  ),
                  Container(
                    width: size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .25,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: ElevatedButton.icon(
                            label: const Text('احجز الان '),
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.appBlue,
                                textStyle: TextStyle(color: Colors.white)),
                            onPressed: () {
                            },
                            icon: Icon(Icons.mail),
                          ),
                        ),
                        Text("333 le",
                          )
                      ],
                    ),
                  ),


                  // buildbar(size, roomsGroups!)
                ]),
          )
        ],
      )
    );
  }

}
