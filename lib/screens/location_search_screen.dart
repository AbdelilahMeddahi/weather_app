import 'dart:convert';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/location/current_location.svg",
                        height: 15,
                        width: 15,
                      ),
                    ),
                  ),
                  Text(
                    "Set Delivery Location",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(blurRadius: 25.0, color: Color(0xFFCBD6E7)),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/location/close.svg",
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: SvgPicture.asset("assets/location/location.svg"),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 3,
              thickness: 3,
              color: Color(0xFFBFBFBF),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Provider.of<WeatherProvider>(context,listen: false).getLocation();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: SvgPicture.asset(
                  "assets/location/current_location.svg",
                ),
                label: Text("Use my current Location"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBFBFBF),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    fixedSize: Size(double.infinity, 40),
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Divider(
              height: 3,
              thickness: 3,
              color: Color(0xFFBFBFBF),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) => LocationListTile(
                        press: () async {
                          Provider.of<WeatherProvider>(context,listen: false).weatherData = await
                              WeatherService()
                                  .getWeather(null,null,placePredictions[index].description,);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        location: placePredictions[index].description!,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
