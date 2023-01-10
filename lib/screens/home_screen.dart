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
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<WeatherProvider>(context).isLoading!){
      Provider.of<WeatherProvider>(context).getLocation();
    };

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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
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
                            Spacer(),
                            Text(
                              weatherData!.name!,
                              style: GoogleFonts.inter(
                                  color: Colors.blueGrey,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Container(
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
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                                      Image.asset("assets/sun.png", height: 70),
                                      Text(
                                        "${weatherData!.temp!.toInt()}℃",
                                        style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 58),
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
                          height: 30,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              minTemp: weatherData!.temp!,
                              maxTemp: weatherData!.temp!,
                              label: weatherData!.conditionText!,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            DayWeatherWidget(
                              minTemp: weatherData!.temp!,
                              maxTemp: weatherData!.temp!,
                              label: weatherData!.conditionText!,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            DayWeatherWidget(
                              minTemp: weatherData!.temp!,
                              maxTemp: weatherData!.temp!,
                              label: weatherData!.conditionText!,
                            ),
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
                              "5day-forecast",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
