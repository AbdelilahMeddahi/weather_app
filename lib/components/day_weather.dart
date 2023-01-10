import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWeatherWidget extends StatelessWidget {
  final double minTemp;
  final double maxTemp;
  final String label;
  const DayWeatherWidget({Key? key, required this.minTemp, required this.maxTemp, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/star.svg",
            height: 20,
          ),
          SizedBox(width: 10,),
          Text("Today-$label"),
          Spacer(),
          Text("$maxTemp℃ / $minTemp℃"),
        ],
      ),
    );
  }
}
