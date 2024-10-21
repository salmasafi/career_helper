import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.text,
    this.widget,
    this.color,
    required this.onTap,
  });

  final double screenWidth;
  final double screenHeight;
  String? text;
  Widget? widget;
  Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.green,
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        width: screenWidth * 0.88,
        height: screenHeight * 0.062,
        child: Center(
          child: text != null ? Text(
            text!,
            style: Styles().style2(
              screenHeight: screenHeight,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ) : widget,
        ),
      ),
    );
  }
}
