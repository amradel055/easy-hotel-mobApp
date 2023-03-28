import 'dart:async';
import 'package:easy_hotel/app/core/utils/permission_handler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/user_location.dart';
import '../views/widgets/info_dialog.dart';

class MapController extends GetxController {

  final List arguments = Get.arguments ;
  Rxn<CameraPosition> initialCameraPos = Rxn();
  final  markersList = (List<Marker>.of([])).obs ;
  final  polyLineList = (List<Polyline>.of([])).obs ;
  PolylinePoints polylinePoints = PolylinePoints();
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final String apiKey = "AIzaSyBrBEab0jI1gdFQfH_pHyQO6PwWjkyl32A";
  final title = "".obs;
  final  image = "".obs ;
  List<LatLng> polylineCoordinates = [];

  @override
  void onInit() async{
    title(arguments[1]);
    image(arguments[2]);
    initialCameraPos(CameraPosition(target: arguments[0] , zoom: 14.4746,));
    markersList.assign(Marker(
      markerId: const MarkerId("service marker") ,
       position: arguments[0] ,
       infoWindow: InfoWindow(title:title.value),
       onTap: () => Get.dialog(InfoDialog(image: image.value, title: title.value,)),
       ));
    await AppPermissionHandler().requestLocationPermission();
    await drawPloyLine();
    super.onInit();
  }

  Future<void> drawPloyLine() async {
      Position? userLocation =  await getUserLocation();
    if(userLocation != null){
      PolylineResult polylineResult = await polylinePoints.getRouteBetweenCoordinates(
          apiKey,
          PointLatLng(userLocation.latitude, userLocation.longitude),
          PointLatLng(arguments[0].latitude, arguments[0].longitude),
          travelMode: TravelMode.driving
      );
      if(polylineResult.points.isNotEmpty){
        for (PointLatLng point in polylineResult.points) {
          LatLng pointLatLng = LatLng(point.latitude, point.longitude);
          polylineCoordinates.add(pointLatLng);
          polyLineList.add(Polyline(polylineId: const PolylineId("service way") , points: polylineCoordinates));
        }
      }
    }
  }

  onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  Future<Position?> getUserLocation()async{
    return await UserLocation().determinePosition();
  }

}