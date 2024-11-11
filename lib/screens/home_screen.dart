import 'package:flutter/material.dart';
import 'home_content.dart';
import 'events_screen.dart';
import 'quizzes_screen.dart';
import 'sharepoint_screen.dart';
import '../widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeContent(),
    EventsScreen(), // Updated EventsScreen with the Wellness tab
    QuizzesScreen(),
    SharePointScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
