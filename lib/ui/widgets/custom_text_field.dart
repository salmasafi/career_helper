import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final Function(String)? onChanged;

  final bool obscureText;

  const CustomTextField({Key? key, required this.labelText, this.onChanged, this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: obscureText == false ? TextInputType.emailAddress : TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white,),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 146, 25, 17)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 146, 25, 17)),
        ),
      ),
    );
  }
}
