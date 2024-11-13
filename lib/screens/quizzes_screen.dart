// Import necessary packages and WebViewScreen #AbdallaFayez
import 'package:flutter/material.dart';
import 'webview_screen.dart';

class QuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIS Grades'),
      ),
      body: WebViewScreen(
        url: 'https://sis.youruniversity.edu/quizzes', // Replace with actual SIS quizzes URL
      ),
    );
  }
}
