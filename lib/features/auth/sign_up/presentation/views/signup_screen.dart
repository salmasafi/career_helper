import 'package:chat_bot/core/utils/responsive.dart';
import 'package:chat_bot/features/auth/sign_up/presentation/views/verify_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../logic/services/auth_service.dart';
import '../../../../../core/widgets/custom_buttom.dart';
import '../../../login/presentation/widgets/custom_textfield.dart';
import '../../../login/presentation/widgets/white_container.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      'Sign Up',
                      style: Styles().style4(
                        context: context,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Enter your details below & free sign up',
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
              screenHeight: responsive.screenHeight * 0.69,              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.screenHeight * 0.04,
                  horizontal: responsive.screenWidth * 0.06,
                ),
                child: Column(
                  children: [
                    SizedBox(height: responsive.screenHeight * 0.03),
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
                      onTap: () async {
                        print(emailText);
                        print(passwordText);
                        User? user =
                            await AuthService().signUpWithEmailAndPassword(
                          context,
                          emailText,
                          passwordText,
                        );
                        if (user != null) {
                          print(
                              'A verification link has been sent to ${emailText}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyEmailScreen(),
                            ),
                          );
                        }
                      },
                      text: 'Create account',
                    ),
                    SizedBox(height: responsive.screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: Styles().style18(context: context,),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Log In',
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
