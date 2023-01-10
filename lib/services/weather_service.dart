import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/api_key.dart';
class WeatherService{

  Future<WeatherModel> getWeather(double lat, double lon) async {
    Uri url = Uri.parse("http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&aqi=yes&days=5");
    http.Response response = await http.get(url);

    Map<String,dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}