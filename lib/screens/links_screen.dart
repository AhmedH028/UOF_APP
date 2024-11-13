// links_screen.dart
import 'package:flutter/material.dart';
import 'webview_screen.dart';

class LinksScreen extends StatefulWidget {
  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  String selectedSection = 'none';

  final List<Map<String, String>> academicLinks = [
    {'title': 'University Portal', 'url': 'https://portal.youruniversity.edu'},
    {'title': 'Library Resources', 'url': 'https://library.youruniversity.edu'},
    {'title': 'Quizzes', 'url': 'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn'}, // Added Quizzes link
  ];

  final List<Map<String, String>> nonAcademicLinks = [
    {'title': 'Campus Events', 'url': 'https://events.youruniversity.edu'},
    {'title': 'Student Services', 'url': 'https://services.youruniversity.edu'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Links'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.school, size: 30),
                      onPressed: () {
                        setState(() {
                          selectedSection = 'academic';
                        });
                      },
                      tooltip: 'Academic Links',
                    ),
                    Text('Academic Links'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.people, size: 30),
                      onPressed: () {
                        setState(() {
                          selectedSection = 'non-academic';
                        });
                      },
                      tooltip: 'Non-Academic Links',
                    ),
                    Text('Non-Academic Links'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  if (selectedSection == 'academic') ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Academic Links',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...academicLinks.map((link) {
                      return ListTile(
                        title: Text(link['title']!),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WebViewScreen(url: link['url']!),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ] else if (selectedSection == 'non-academic') ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Non-Academic Links',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...nonAcademicLinks.map((link) {
                      return ListTile(
                        title: Text(link['title']!),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WebViewScreen(url: link['url']!),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
