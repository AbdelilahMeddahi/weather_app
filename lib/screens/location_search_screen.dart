import 'dart:convert';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/location_list_tile.dart';
import 'package:weather_app/models/place_auto_complete_response.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/places_autocomplete_service.dart';
import 'package:weather_app/utils/api_key.dart';

import '../models/autocomplete_prediction.dart';
import '../providers/weather_provider.dart';
import '../services/weather_service.dart';
import '../utils/constants.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "types": "geocode", "key": placesApiKey});

    //the get request
    String? response = await placesService.fetchUrl(uri);
    if (response != null) {
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Provider.of<WeatherProvider>(context,
                                  listen: false)
                              .getLocation();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                            ],
                          ),
                          child: SvgPicture.asset(
                            "assets/location/current_location.svg",
                            fit: BoxFit.scaleDown,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      Text(
                        "Set Location",
                        style: GoogleFonts.inter(
                            color: Colors.blueGrey,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                            ],
                          ),
                          child: SvgPicture.asset(
                            "assets/location/close.svg",
                            fit: BoxFit.scaleDown,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      onChanged: (value) {
                        placeAutocomplete(value);
                      },
                      textInputAction: TextInputAction.search,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        filled: true,
                        hintText: "Search your location",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            "assets/location/location.svg",
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () async {
                      await Provider.of<WeatherProvider>(context, listen: false)
                          .getLocation();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: GlassmorphicContainer(
                      width: double.infinity,
                      height: 50,
                      borderRadius: borderRadius,
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
                      border: 1,
                      blur: 20000,
                      borderGradient: LinearGradient(
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
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "assets/location/current_location.svg",color: Colors.black87,),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Use my current location",
                            style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.grey,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: placePredictions.length,
                      itemBuilder: (context, index) => LocationListTile(
                            press: () async {
                              Provider.of<WeatherProvider>(context,
                                          listen: false)
                                      .weatherData =
                                  await WeatherService().getWeather(
                                null,
                                null,
                                placePredictions[index].description,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            location: placePredictions[index].description!,
                          )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
