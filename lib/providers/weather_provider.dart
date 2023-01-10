import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/location_service.dart';

import '../services/weather_service.dart';


class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  bool? _isLoading = true;
  double? _lattitude = 6.7538;
  double? _longtitude = 3.0588;


  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
  }
  WeatherModel? get weatherData => _weatherData;

  set lattitude(double? lat) {
    _lattitude = lat;
  }
  double? get lattitude => _lattitude;

  set longtitude(double? lon) {
    _longtitude = lon;
  }
  double? get longtitude => _longtitude;

  set isLoading(bool? loading) {
    _isLoading = loading;
  }
  bool? get isLoading => _isLoading;

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
      lattitude = value.latitude;
      longtitude = value.longitude;
      isLoading = false;
      print("bool value has changed now");
      return WeatherService()
          .getWeather(value.latitude, value.longitude)
          .then((value) {
        weatherData = value;
        notifyListeners();
      });
    });
  }

}
