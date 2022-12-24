import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({required this.image, Key? key}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: size.height * 0.5,
                width: size.width,
                child: Image(image: NetworkImage(image) , fit: BoxFit.contain,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close , size: 35, color: Colors.red,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
