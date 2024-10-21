import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../logic/services/auth_service.dart';
import '../../../login/presentation/widgets/custom_buttom.dart';
import '../../../login/presentation/widgets/custom_textfield.dart';
import '../../../login/presentation/widgets/white_container.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenHeight * 0.105,
                bottom: screenHeight * 0.01,
              ),
              child: SizedBox(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          height: screenHeight * 0.10,
                          width: screenHeight * 0.10,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                    ),
                    Text(
                      'Sign Up',
                      style: Styles().style4(
                        screenHeight: screenHeight,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Enter your details below & free sign up',
                      style: Styles().style18(
                        screenHeight: screenHeight,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            WhiteBorderRadiusContainer(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.04,
                  horizontal: screenWidth * 0.06,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      hintText: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.032),
                    CustomTextField(
                      controller: passwordController,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    CustomButtom(
                      onTap: () {
                        AuthService().signUpWithEmailAndPassword(
                          context,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Create account',
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: Styles().style18(screenHeight: screenHeight),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Log In',
                            style: Styles().style18(
                              screenHeight: screenHeight,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
