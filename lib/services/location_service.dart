import 'package:geolocator/geolocator.dart';


class LocationService {
  //create various variables
  bool isLoading = true;
  double lattitude = 6.7538;
  double longtitude = 3.0588;

  getLocation() async {
    bool _isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;
    if (!_isLocationServiceEnabled) {
      return Future.error('Location not enabled');
    }
    // status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      //request permission demand
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }
    // getting current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update lat and lon
      this.lattitude = value.latitude;
      this.longtitude = value.longitude;
      this.isLoading = false;
      print("bool value has change dnow");
    });
  }
}
