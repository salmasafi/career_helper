import 'package:ai_app/features/auth/login/presentation/views/login_screen.dart';
import 'package:ai_app/features/auth/sign_up/presentation/views/signup_screen.dart';

import 'features/chat/ui/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
/////
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'ChatPage': (context) => const ChatPage(),
        'LoginPage': (context) => const LoginScreen(),
        'SignUpPage': (context) => const SignupScreen(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
