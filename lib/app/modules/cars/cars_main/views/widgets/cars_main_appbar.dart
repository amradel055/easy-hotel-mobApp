import 'package:easy_hotel/app/components/text_widget.dart';
import 'package:easy_hotel/app/core/values/app_colors.dart';
import 'package:easy_hotel/app/data/provider/api_provider.dart';
import 'package:flutter/material.dart';

class CarsMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CarsMainAppbar(this.height , this.title , this.subTitle , this.centerTitle ,this.imageIn,{Key? key }) : super(key: key);
  final double height ;
  final String title ;
  final String subTitle ;
  final bool centerTitle ;
  final String imageIn ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: size.height,
        width: size.width ,

        decoration:  BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    ApiProvider.imageUrl+imageIn
                ),
                fit: BoxFit.fitWidth)),
        child: Padding(
          padding:  EdgeInsets.fromLTRB(size.width * 0.01,0,size.width * 0.04,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0 ,0 ,0 ,0 ),
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios , color: Colors.white, size: size.width * 0.06,)),
                      // IconButton(
                      //     onPressed: (){
                      //     },
                      //     icon: Icon(Icons.menu , color: Colors.white, size: size.width * 0.06,)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: centerTitle ? CrossAxisAlignment.center :  CrossAxisAlignment.end  ,
                  children: [
                    TextWidget(
                      title ,
                      textColor: AppColors.white,
                      size: 21,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,),
                    TextWidget(
                      subTitle ,
                      size: 20,
                      textColor: AppColors.white,
                      weight: FontWeight.bold,
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}