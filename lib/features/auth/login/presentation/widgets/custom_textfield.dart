import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Styles().style18(
        screenHeight: screenHeight,
        color: AppColors.black,
      ),
      cursorColor: AppColors.darkGrey,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: Styles().style18(
          screenHeight: screenHeight,
          color: AppColors.black,
        ),
        suffixIcon: obscureText ? const Icon(Icons.remove_red_eye) : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
      ),
    );
  }
}
