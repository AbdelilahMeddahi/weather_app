import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/star.svg'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Let's See\nThe ⭐\nWeather\nAround you",
                style: GoogleFonts.poppins(
                    fontSize: 36,
                    color: Color(0xFF0C1823),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: Color(0xFF0C1823)),
              child: Center(
                  child: Text(
                "Let's Check",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
