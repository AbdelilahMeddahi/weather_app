import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailThreeWidget extends StatelessWidget {
  final String icon;
  final String label;
  final String number;

  const DetailThreeWidget(
      {Key? key, required this.icon, required this.label, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      child: Column(
        children: [
          SvgPicture.asset(
            "$icon",
            height: 25,
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            "$label",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                color: Color(0xFFCDD2DE),
                fontWeight: FontWeight.normal,
                fontSize: 13),
          ),
          SizedBox(
            height: 1,
          ),
          Text(
            "$number",
            style: GoogleFonts.inter(
                color: Color(0xFF333333),
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
