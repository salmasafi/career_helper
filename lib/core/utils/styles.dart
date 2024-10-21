import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Styles {
  TextStyle style18(
      {required double screenHeight, Color color = AppColors.darkGrey, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: screenHeight * 0.018,
      fontWeight: fontWeight,
    );
  }

  TextStyle style16(
      {required double screenHeight, Color color = AppColors.darkGrey, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: screenHeight * 0.016,
      fontWeight: fontWeight,
    );
  }

  TextStyle style4(
      {required double screenHeight, Color color = AppColors.darkGrey, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: screenHeight * 0.04,
      fontWeight: fontWeight,
    );
  }

  TextStyle style2(
      {required double screenHeight, Color color = AppColors.darkGrey, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: screenHeight * 0.02,
      fontWeight: fontWeight,
    );
  }

  TextStyle style3(
      {required double screenHeight, Color color = AppColors.black, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: screenHeight * 0.03,
      fontWeight: fontWeight,
     
    );
  }
}
