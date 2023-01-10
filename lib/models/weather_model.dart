class WeatherModel {
  String? name;
  String? region;
  String? localtime;
  double? temp;
  double? minTemp;
  double? maxTemp;
  double? feelsLike;
  String? conditionText;
  String? conditionIcon;
  int? windDegree;
  double? windSpeed;
  int? chanceOfRain;
  double? pressure;
  double? vision;
  int? humidity;
  int? cloud;

  WeatherModel({
    required this.temp,
    required this.chanceOfRain,
    required this.minTemp,
    required this.maxTemp,
    required this.vision,
    required this.feelsLike,
    required this.region,
    required this.windSpeed,
    required this.name,
    required this.cloud,
    required this.conditionIcon,
    required this.conditionText,
    required this.humidity,
    required this.localtime,
    required this.pressure,
    required this.windDegree,
  });

  factory WeatherModel.fromJson(dynamic json) {
    return WeatherModel(
      region: json['location']["region"],
      chanceOfRain: json['forecast']["forecastday"][0]["day"]["daily_chance_of_rain"],
      temp: json['current']["temp_c"],
      minTemp: json['forecast']["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: json['forecast']["forecastday"][0]["day"]["maxtemp_c"],
      vision: json['current']["vis_km"],
      feelsLike: json['current']["feelslike_c"],
      windSpeed: json['current']["wind_kph"],
      name: json['location']["name"],
      cloud: json['current']["cloud"],
      conditionIcon: json['current']["condition"]["icon"],
      conditionText: json['current']["condition"]["text"],
      humidity: json['current']["humidity"],
      localtime: json['location']["localtime"],
      pressure: json['current']["pressure_mb"],
      windDegree: json['current']["wind_degree"],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "temp = $temp, name = $name, cloud = $cloud";
  }
}
