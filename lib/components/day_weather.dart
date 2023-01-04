import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DayWeatherWidget extends StatelessWidget {
  const DayWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Tue"),
              SizedBox(height: 3,),
              Text("10/07"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            "assets/star.svg",
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "22℃",
            style: GoogleFonts.inter(
                color: Color(0xFF29292C),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 40,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Text(
              "193",
              style: GoogleFonts.inter(color: Colors.white, fontSize: 11),
            )),
          ),
        ],
      ),
    );
  }
}
