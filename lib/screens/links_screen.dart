// links_screen.dart
import 'package:first_app/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class LinksScreen extends StatefulWidget {
  @override
  _LinksScreenState createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  String selectedSection = 'none';

  final List<Map<String, String>> academicLinks = [
    {'title': 'University Portal', 'url': 'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn'},
    {'title': 'Library Resources', 'url': 'https://library.youruniversity.edu'},
    {'title': 'Quizzes', 'url': 'https://upeisis.uofcanada.edu.eg/PowerCampusSelfService/Home/LogIn'},
    {'title': 'Helpdesk Email', 'action': 'email', 'email': 'helpdesk@uofcanada.edu.eg'},
    {'title': 'Tutor2u', 'url': 'https://www.tutor2u.net/'},
    {'title': 'ICareer', 'url': 'https://www.instagram.com/icareer.eg/'},
    {'title': 'Study Rooms Booking', 'url': 'https://studyroomlink.edu'},
    {'title': 'Academic Calendar', 'url': 'https://canwellnet.sharepoint.com/sites/UCEDL/IT%20Policies%20and%20Procedures/Forms/AllItems.aspx?id=%2Fsites%2FUCEDL%2FIT%20Policies%20and%20Procedures%2FAcademic%2FUPEI%20Cairo%20Campus%20Policies%20%26%20Procedures%2FCalendar%20Dates%202024%2E07%2E17%2Epdf&parent=%2Fsites%2FUCEDL%2FIT%20Policies%20and%20Procedures%2FAcademic%2FUPEI%20Cairo%20Campus%20Policies%20%26%20Procedures&p=true&ga=1'},
    {'title': 'Townhall', 'url': 'https://canwellnet.sharepoint.com/sites/UCEDL'},
    {'title': 'Policies', 'url': 'https://canwellnet.sharepoint.com/sites/UCEDL/IT%20Policies%20and%20Procedures/Forms/AllItems.aspx'},
  ];

  final List<Map<String, dynamic>> nonAcademicLinks = [
    {
      'title': 'Gym',
      'subItems': [
        {'title': 'Yoga', 'url': 'https://gymclasseslink.edu/yoga'},
        {'title': 'Boxing', 'url': 'https://gymclasseslink.edu/boxing'},
      ]
    },
    {'title': 'Bus Routes and Schedule', 'url': 'https://bus-schedule-link.edu/Bus-Routes-Pickup-Points.pdf'},
    {'title': 'Fleet Manager', 'action': 'copy', 'text': '01008470311'},
    {'title': 'Location & Map', 'action': 'map', 'url': 'https://g.page/UofCanada/'},
  ];

  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(emailLaunchUri);
  }

  Future<void> _launchMap(String url) async {
    await launchUrl(Uri.parse(url));
  }

  Future<void> _launchLink(String url) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
  }

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
                      if (link.containsKey('action') && link['action'] == 'email') {
                        return ListTile(
                          title: Text(link['title']!),
                          trailing: Icon(Icons.mail),
                          onTap: () => _launchEmail(link['email']!),
                        );
                      } else {
                        return ListTile(
                          title: Text(link['title']!),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () => _launchLink(link['url']!),
                        );
                      }
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
                      if (link.containsKey('subItems')) {
                        return ExpansionTile(
                          title: Text(link['title']),
                          children: (link['subItems'] as List).map<Widget>((subLink) {
                            return ListTile(
                              title: Text(subLink['title']),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: () => _launchLink(subLink['url']),
                            );
                          }).toList(),
                        );
                      } else if (link['action'] == 'copy') {
                        return ListTile(
                          title: Text(link['title']!),
                          trailing: Icon(Icons.copy),
                          onTap: () => _copyToClipboard(link['text']!),
                        );
                      } else if (link['action'] == 'map') {
                        return ListTile(
                          title: Text(link['title']!),
                          trailing: Icon(Icons.map),
                          onTap: () => _launchMap(link['url']!),
                        );
                      } else {
                        return ListTile(
                          title: Text(link['title']!),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () => _launchLink(link['url']!),
                        );
                      }
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
