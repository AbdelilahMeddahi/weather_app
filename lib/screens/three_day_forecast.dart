import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class ThreeDayForecast extends StatelessWidget {
  ThreeDayForecast({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      backgroundColor: const Color(0x000c1823),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,),
              child: Text(
                "3 day-forecast",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today",style: GoogleFonts.inter(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 5,),
                      Text(DateFormat('Md').format(DateTime.now()),style: GoogleFonts.inter(color: Colors.grey,fontSize: 11,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      Image.network("https:${weatherData!.forecast[0]!.twoPMIcon!}",height: 50),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Tomorrow",style: GoogleFonts.inter(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 5,),
                      Text(DateFormat('Md').format(DateTime.now().add(const Duration(days: 1))),style: GoogleFonts.inter(color: Colors.grey,fontSize: 11,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      Image.network("https:${weatherData!.forecast[1]!.twoPMIcon!}",height: 50),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 2))).substring(0, 3),style: GoogleFonts.inter(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 5,),
                      Text(DateFormat('Md').format(DateTime.now().add(const Duration(days: 2))),style: GoogleFonts.inter(color: Colors.grey,fontSize: 11,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      Image.network("https:${weatherData!.forecast[2]!.twoPMIcon!}",height: 50),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Sparkline(
                lineColor: Colors.white,
                lineWidth: 2,
                fallbackHeight: 70,
                useCubicSmoothing: true,
                kLine: const ['max', 'min', 'first', 'last'],
                data: [
                  weatherData!.forecast[0]!.maxTemp!,
                  weatherData!.forecast[1]!.maxTemp!,
                  weatherData!.forecast[2]!.maxTemp!,
                ],
                pointsMode: PointsMode.all,
                pointSize: 8.0,
                pointColor: Colors.amber,
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Sparkline(
                lineColor: Colors.white,
                lineWidth: 2,
                fallbackHeight: 70,
                useCubicSmoothing: true,
                kLine: const ['max', 'min', 'first', 'last'],
                data: [
                  weatherData!.forecast[0]!.minTemp!,
                  weatherData!.forecast[1]!.minTemp!,
                  weatherData!.forecast[2]!.minTemp!,
                ],
                pointsMode: PointsMode.all,
                pointSize: 8.0,
                pointColor: Colors.amber,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https:${weatherData!.forecast[0]!.fiveAMIcon!}",height: 50),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(Icons.double_arrow_sharp,color: Colors.white,size: 10),
                          Text(
                            "${weatherData!.forecast[0]!.maxWind!}km/h",style: GoogleFonts.inter(color: Colors.white,fontSize: 10,),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https:${weatherData!.forecast[1]!.fiveAMIcon!}",height: 50),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Icon(Icons.double_arrow_sharp,color: Colors.white,size: 10),
                          Text(
                            "${weatherData!.forecast[1]!.maxWind!}km/h",style: GoogleFonts.inter(color: Colors.white,fontSize: 10,),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https:${weatherData!.forecast[2]!.fiveAMIcon!}",height: 50),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/location/wind_indicator.svg"),
                          Text(
                            "${weatherData!.forecast[2]!.maxWind!}km/h",style: GoogleFonts.inter(color: Colors.white,fontSize: 10,),),
                        ],
                      ),
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
