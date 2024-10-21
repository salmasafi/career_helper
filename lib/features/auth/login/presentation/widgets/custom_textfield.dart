// ignore_for_file: must_be_immutable

import 'package:chat_bot/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.textFieldType = 'text',
    this.obscureText = false,
    this.onChanged,
  });

  final String hintText;
  final String textFieldType;
  bool obscureText;
  void Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    if (widget.textFieldType == 'password') {
      widget.obscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return TextField(
      onChanged: widget.onChanged,
      style: Styles().style18(
        context: context,
        color: AppColors.black,
      ),
      cursorColor: AppColors.darkGrey,
      keyboardType: TextInputType.visiblePassword,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: Styles().style18(
          context: context,
          color: AppColors.black,
        ),
        suffixIcon: widget.textFieldType == 'password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(responsive.screenWidth * 0.04),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(responsive.screenWidth * 0.04),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGrey),
          borderRadius: BorderRadius.circular(responsive.screenWidth * 0.04),
        ),
      ),
    );
  }
}
