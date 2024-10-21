import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'responsive.dart';

class Styles {
  TextStyle style18(
      {required BuildContext context,
      Color color = AppColors.darkGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    Responsive responsive = Responsive.of(context);
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsive.screenHeight * 0.018,
      fontWeight: fontWeight,
    );
  }

  TextStyle style16(
      {required BuildContext context,
      Color color = AppColors.darkGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    Responsive responsive = Responsive.of(context);
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsive.screenHeight * 0.016,
      fontWeight: fontWeight,
    );
  }

  TextStyle style4(
      {required BuildContext context,
      Color color = AppColors.darkGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    Responsive responsive = Responsive.of(context);
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsive.screenHeight * 0.04,
      fontWeight: fontWeight,
    );
  }

  TextStyle style2(
      {required BuildContext context,
      Color color = AppColors.darkGrey,
      FontWeight fontWeight = FontWeight.w400}) {
    Responsive responsive = Responsive.of(context);
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsive.screenHeight * 0.02,
      fontWeight: fontWeight,
    );
  }

  TextStyle style3(
      {required BuildContext context,
      Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w400}) {
    Responsive responsive = Responsive.of(context);
    return GoogleFonts.poppins(
      color: color,
      fontSize: responsive.screenHeight * 0.03,
      fontWeight: fontWeight,
    );
  }
}
