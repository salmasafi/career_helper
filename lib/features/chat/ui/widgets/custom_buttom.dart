import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {

  final String bottomText;
  final VoidCallback onTap;

  const CustomButtom({Key? key, required this.bottomText, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        color: Colors.white,
        onPressed: onTap,
        child: Text(
          bottomText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
