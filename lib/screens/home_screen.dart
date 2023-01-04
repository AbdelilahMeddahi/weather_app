import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/components/day_weather.dart';
import 'package:weather_app/components/detail_three_fields.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(blurRadius: 25.0, color: Color(0xFFCBD6E7)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/sun.png", height: 70),
                                Text(
                                  "22℃",
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 58),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Cloudy to clear",
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
                                SvgPicture.asset("assets/Wind.svg", height: 80),
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
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AIR QUALITY",
                            style: GoogleFonts.inter(
                                color: const Color(0xFF333333),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: -0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              DetailThreeWidget(
                                icon: "assets/icons/Wind.svg",
                                label: "wind\nspeed",
                                number: "9km/h",
                              ),
                              DetailThreeWidget(
                                icon: "assets/icons/Drop.svg",
                                label: "sulfur\ndioxide",
                                number: "9km/h",
                              ),
                              DetailThreeWidget(
                                icon: "assets/icons/CloudRain.svg",
                                label: "rain",
                                number: "9km/h",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              DetailThreeWidget(
                                icon: "assets/icons/SunHorizon.svg",
                                label: "ultraviolet\nlight",
                                number: "9km/h",
                              ),
                              DetailThreeWidget(
                                icon: "assets/icons/Thermometer.svg",
                                label: "body\ntemperature",
                                number: "9km/h",
                              ),
                              DetailThreeWidget(
                                icon: "assets/icons/SunHorizon.svg",
                                label: "ozone",
                                number: "9km/h",
                              ),
                            ],
                          ),
                        ]),
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      DayWeatherWidget(),
                      DayWeatherWidget(),
                      DayWeatherWidget(),
                    ],
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
