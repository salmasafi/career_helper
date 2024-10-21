import 'package:chat_bot/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../logic/services/auth_service.dart';
import '../../../login/presentation/widgets/custom_textfield.dart';
import '../../../login/presentation/widgets/white_container.dart';
import '../../../sign_up/presentation/views/signup_screen.dart';
import '../../../../../core/widgets/custom_buttom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    String emailText = '';
     String passwordText = '';

    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsive.screenWidth * 0.05,
                right: responsive.screenWidth * 0.05,
                top: responsive.screenHeight * 0.105,
                bottom: responsive.screenHeight * 0.01,
              ),
              child: SizedBox(
                width: responsive.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: responsive.screenHeight * 0.10,
                        width: responsive.screenHeight * 0.10,
                        // child: Image.asset(
                        //   'assets/images/logo.png',
                        // ),
                      ),
                    ),
                    Text(
                      'Log In',
                      style: Styles().style4(
                        context: context,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Enter your details below to log in',
                      style: Styles().style18(
                        context: context,
                        color: AppColors.kWhite,
                      ),
                    ),
                    SizedBox(
                      height: responsive.screenHeight * 0.015,
                    ),
                  ],
                ),
              ),
            ),
            WhiteBorderRadiusContainer(
              screenWidth: responsive.screenWidth,
              screenHeight: responsive.screenHeight * 0.69,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.screenHeight * 0.04,
                  horizontal: responsive.screenWidth * 0.06,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: responsive.screenHeight * 0.03,
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      onChanged: (value){
                        emailText = value;
                      },
                    ),
                    SizedBox(height: responsive.screenHeight * 0.032),
                    CustomTextField(
                      hintText: 'Password',
                      textFieldType: 'password',
                      obscureText: true,
                      onChanged: (value){
                        passwordText = value;
                      },
                    ),
                    SizedBox(height: responsive.screenHeight * 0.030),
                    CustomButtom(
                      onTap: () {
                        AuthService().signInWithEmailAndPassword(
                          context,
                          emailText,
                          passwordText,
                        );
                      },
                      text: 'Log In',
                    ),
                    SizedBox(height: responsive.screenHeight * 0.030),

                    // CustomButtom(
                    //   screenWidth: screenWidth,
                    //   screenHeight: screenHeight,
                    //   color: AppColors.green,
                    //   widget: SizedBox(
                    //     height: screenHeight * 0.04,
                    //     width: screenHeight * 0.04,
                    //     child: Image.asset(
                    //       'assets/images/google_logo.svg.png',
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     AuthService().signInWithGoogle(context);
                    //   },
                    // ),
                    //SizedBox(height: screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: Styles().style18(
                            context: context,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: Styles().style18(
                              context: context,
                              color: AppColors.kSecondryColor,
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
