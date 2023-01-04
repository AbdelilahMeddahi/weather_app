import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0x0C1823),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/splash_logo.png'),
            SizedBox(height: 20,),
            Text('Weather X',style: GoogleFonts.syncopate(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
