import 'package:chat_ex01/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catting app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginSingupScreen(),
    );
  }
}
