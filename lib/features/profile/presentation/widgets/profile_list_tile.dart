import 'package:chat_bot/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: responsive.screenHeight * 0.010,
        left: responsive.screenWidth * 0.010,
      ),
      child: ListTile(
        leading: Text(
          title,
          style: Styles().style2(
            context: context,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        trailing: SizedBox(
          height: responsive.screenHeight * 0.05,
          width: responsive.screenWidth * 0.05,
          child: SvgPicture.asset(
            'assets/images/arrow_eye.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
