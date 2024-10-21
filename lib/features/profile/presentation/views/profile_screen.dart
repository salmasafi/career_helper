import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Account',
          style: Styles().style3(
            context: context,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(
                'assets/images/Avatar.svg',
                fit: BoxFit.contain,
              ),
            ),
            ProfileListTile(title: 'Favourite',),
            ProfileListTile(title: 'Edit account',),
            ProfileListTile(title: 'Settings and Privacy',),
            ProfileListTile(title: 'Help',),
          ],
        ),
      ),
    );
  }
}
