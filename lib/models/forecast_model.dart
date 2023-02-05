class ForecastModel {
  double? maxTemp;
  double? minTemp;
  double? maxWind;
  String? fiveAMIcon;
  String? twoPMIcon;
  String? conditionText;
  String? icon;

  ForecastModel({
    required this.maxWind,
    required this.minTemp,
    required this.maxTemp,
    required this.fiveAMIcon,
    required this.twoPMIcon,
    required this.conditionText,
    required this.icon,
  });

  factory ForecastModel.fromJson(dynamic json, int index) {
    return ForecastModel(
      maxWind: json["forecast"]["forecastday"][index]["day"]["maxwind_kph"],
      maxTemp: json["forecast"]["forecastday"][index]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][index]["day"]["mintemp_c"],
      twoPMIcon: json["forecast"]["forecastday"][index]["hour"][5]["condition"]
          ["icon"],
      fiveAMIcon: json["forecast"]["forecastday"][index]["hour"][14]
          ["condition"]["icon"],
      conditionText: json["forecast"]["forecastday"][index]["day"]["condition"]
          ["text"],
      icon: json["forecast"]["forecastday"][index]["day"]["condition"]["icon"],
    );
  }
}
