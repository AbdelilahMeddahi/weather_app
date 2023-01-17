class ForecastModel {
  double? maxTemp;
  double? minTemp;
  double? maxWind;
  String? conditionText;
  String? icon;

  ForecastModel({
    required this.maxWind,
    required this.minTemp,
    required this.maxTemp,
    required this.conditionText,
    required this.icon,
  });

  factory ForecastModel.fromJson(dynamic json,int index) {
    return ForecastModel(
      maxWind: json["forecast"]["forecastday"][index]["day"]["maxwind_kph"],
      maxTemp: json["forecast"]["forecastday"][index]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][index]["day"]["mintemp_c"],
      conditionText: json["forecast"]["forecastday"][index]["day"]["condition"]["text"],
      icon: json["forecast"]["forecastday"][index]["day"]["condition"]["icon"],

    );
  }
}
