import 'package:chat_bot/features/profile/presentation/views/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        if (user.emailVerified) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        } else {
          print('Email not verified. Please check your inbox.');
        }
      }
      return user;
    } catch (e) {
      print('Error during email sign in: $e');
      return null;
    }
  }

  Future<void> sendVerificationCode() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      print('Verification link sent to email: ${_auth.currentUser!.email!}');
    } catch (e) {
      print('Error sending verification link: $e');
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await sendVerificationCode();
        print('A verification link has been sent to $email');
      }
      return user;
    } catch (e) {
      print('Error during email sign up: $e');
      return null;
    }
  }

  Future<void> checkEmailVerification(BuildContext context) async {
    User? user = _auth.currentUser;

    if (user != null) {
      await user.reload();
      user = _auth.currentUser;

      if (user!.emailVerified) {
        print('Email is verified.');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      } else {
        print('Email is not verified. Please check your inbox.');
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
