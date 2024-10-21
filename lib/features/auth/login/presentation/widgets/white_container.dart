import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class WhiteBorderRadiusContainer extends StatelessWidget {
  const WhiteBorderRadiusContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.child,
  });

  final double screenWidth;
  final double screenHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.05),
          topRight: Radius.circular(screenWidth * 0.05),
        ),
      ),
      child: child,
    );
  }
}
