
import 'package:permission_handler/permission_handler.dart';


class AppPermissionHandler {


  requestLocationPermission()async{
    if(!await Permission.location.request().isGranted){
      return ;
    }
    await Permission.location.request();
  }
}