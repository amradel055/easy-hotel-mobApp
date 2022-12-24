
import 'package:flutter/material.dart';
import 'widgets/map_widget.dart';

class MapsView extends StatelessWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: MapWidget(),
      ),
    );
  }
}
