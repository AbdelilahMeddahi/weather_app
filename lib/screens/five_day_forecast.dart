import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiveDayForecast extends StatelessWidget {
  const FiveDayForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0C1823),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: GestureDetector(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "5 day-forecast",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
