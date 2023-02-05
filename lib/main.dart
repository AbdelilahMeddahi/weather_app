import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/first_splash_screen.dart';
import 'package:weather_app/screens/location_search_screen.dart';
import 'package:weather_app/screens/second_splash_screen.dart';
import 'screens/three_day_forecast.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather X',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  FirstSplashScreen(),
      ),
    );
  }
}
