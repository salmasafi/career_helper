import 'package:chat_bot/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    this.text,
    this.widget,
    this.color,
    required this.onTap,
  });

  String? text;
  Widget? widget;
  Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? AppColors.kSecondryColor,
          borderRadius: BorderRadius.circular(responsive.screenWidth * 0.04),
        ),
        width: responsive.screenWidth * 0.88,
        height: responsive.screenHeight * 0.062,
        child: Center(
          child: text != null ? Text(
            text!,
            style: Styles().style2(
              context: context,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ) : widget,
        ),
      ),
    );
  }
}
