import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/map_controller.dart';

class MapWidget extends GetView<MapController> {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GoogleMap(
        initialCameraPosition: controller.initialCameraPos.value!,
        markers: controller.markersList.toList().toSet(),
        polylines:controller.polyLineList.toList().toSet() ,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        padding: const EdgeInsets.only(top: 50),
        onMapCreated: controller.onMapCreated,
      );
    });
  }
}
