import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/day_weather.dart';
import 'package:weather_app/components/detail_three_fields.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/screens/location_search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<WeatherProvider>(context).isLoading!) {
      Provider.of<WeatherProvider>(context).getLocation();
    }
    ;

    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      body: SafeArea(
        child: weatherData == null
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/eclipse1.png"),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/eclipse3.png"),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/eclipse2.png"),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 180, sigmaY: 120),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 25.0,
                                          color: Color(0xFFCBD6E7)),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.list_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 210,
                                child: Text(
                                  weatherData!.name!,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      color: Colors.blueGrey,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LocationSearchScreen()));
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 25.0,
                                          color: Color(0xFFCBD6E7)),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                            ]),
                            child: GlassmorphicContainer(
                              width: 500,
                              height: 170,
                              borderRadius: 25,
                              blur: 20000,
                              alignment: Alignment.bottomCenter,
                              border: 1,
                              linearGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFF67E1D2).withOpacity(1),
                                    const Color(0xFF54A8FF).withOpacity(1),
                                  ],
                                  stops: const [
                                    0.1,
                                    1,
                                  ]),
                              borderGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.5),
                                  const Color((0xFFFFFFFF)).withOpacity(0.5),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(
                                          "https:${weatherData!.conditionIcon!}",
                                        ),
                                        Text(
                                          "${weatherData!.temp!.toInt()}℃",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 58,
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    Colors.white,
                                                    Colors.white.withOpacity(0.2),
                                                    //add more color here.
                                                  ],
                                                ).createShader(Rect.fromLTWH(
                                                    200.0,100.0, 200.0, 200.0))),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${weatherData!.conditionText}",
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "Tuesday, 10/22",
                                              style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset("assets/Wind.svg",
                                            height: 80),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DetailThreeWidget(
                                        icon: "assets/icons/Wind.svg",
                                        label: "wind speed",
                                        number: "${weatherData!.windSpeed}km/h",
                                      ),
                                      DetailThreeWidget(
                                        icon: "assets/icons/Drop.svg",
                                        label: "humidity",
                                        number: "${weatherData!.humidity}%",
                                      ),
                                      DetailThreeWidget(
                                        icon: "assets/icons/SunHorizon.svg",
                                        label: "vision",
                                        number: "${weatherData!.vision}km",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DetailThreeWidget(
                                        icon: "assets/icons/SunHorizon.svg",
                                        label: "pressure",
                                        number:
                                            "${weatherData!.pressure!.toInt()}mb",
                                      ),
                                      DetailThreeWidget(
                                        icon: "assets/icons/CloudRain.svg",
                                        label: "chance of rain",
                                        number: "${weatherData!.chanceOfRain}%",
                                      ),
                                      DetailThreeWidget(
                                        icon: "assets/icons/Thermometer.svg",
                                        label: "feels like",
                                        number: "${weatherData!.feelsLike}℃",
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              DayWeatherWidget(
                                day: "Today",
                                minTemp: weatherData!.forecast[0]!.minTemp!,
                                maxTemp: weatherData!.forecast[0]!.maxTemp!,
                                label: weatherData!.forecast[0]!.conditionText!,
                                icon: weatherData!.forecast[0]!.icon!,
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              DayWeatherWidget(
                                  day: "Tomorrow",
                                  minTemp: weatherData!.forecast[1]!.minTemp!,
                                  maxTemp: weatherData!.forecast[1]!.maxTemp!,
                                  label:
                                      weatherData!.forecast[1]!.conditionText!,
                                  icon: weatherData!.forecast[1]!.icon!),
                              SizedBox(
                                height: 14,
                              ),
                              DayWeatherWidget(
                                  day:
                                      "${DateFormat('EEEE').format(DateTime.now().add(Duration(days: 2))).substring(0, 3)}",
                                  minTemp: weatherData!.forecast[2]!.minTemp!,
                                  maxTemp: weatherData!.forecast[2]!.maxTemp!,
                                  label:
                                      weatherData!.forecast[2]!.conditionText!,
                                  icon: weatherData!.forecast[2]!.icon!),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "3 day-forecast",
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
