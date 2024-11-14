import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const UPEIApp());
}

class UPEIApp extends StatelessWidget {
  const UPEIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UOC Mobile App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 151, 22, 37),
        hintColor: const Color.fromARGB(255, 97, 206, 112),
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}
