import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle roboto16x500 = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  textStyle: const TextStyle(
    color: Color(0xff4CAF50),
  ),
);

TextStyle robotoHead400x12 = GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  textStyle: TextStyle(
    color: const Color(0xff7C7E92).withOpacity(0.56),
    height: 1.33,
  ),
);

TextStyle roboto400x12 = GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  textStyle: const TextStyle(
    color: Color(0xff3B3E5B),
    height: 1.33,
  ),
);

ButtonStyle buttonGreenCircle = ElevatedButton.styleFrom(
  elevation: 0,
  fixedSize: const Size(64, 64),
  primary: const Color(0xff4CAF50).withOpacity(0.16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);
