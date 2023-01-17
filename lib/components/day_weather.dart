import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWeatherWidget extends StatelessWidget {
  final double minTemp;
  final double maxTemp;
  final String label;
  final String icon;
  final String day;
  const DayWeatherWidget({Key? key, required this.minTemp, required this.maxTemp, required this.label, required this.day, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('https:$icon',height: 40),
          SizedBox(width: 10,),
          SizedBox(width: 170,child: Text("$day·$label",style: GoogleFonts.inter(fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis)),
          Spacer(),
          Text("$minTemp℃ / $maxTemp℃"),
        ],
      ),
    );
  }
}
