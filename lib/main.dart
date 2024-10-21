import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/auth/login/presentation/views/login_screen.dart';
import 'features/auth/sign_up/presentation/views/signup_screen.dart';
import 'features/chat/ui/screens/chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}
// Hi again

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
