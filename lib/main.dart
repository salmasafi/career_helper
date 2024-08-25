import 'ui/screens/chat.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'ChatPage': (context) => ChatPage(),
      },
      initialRoute: 'ChatPage',
    );
  }
}
