// Import the required packages and screens #AbdallaFayez
import 'package:flutter/material.dart';
import 'webview_screen.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.event, size: 30),
                      onPressed: () {
                        Navigator.pushNamed(context, '/microsoftEvents');
                      },
                      tooltip: 'Microsoft Events',
                    ),
                    Text('Events'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.schedule, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              url:
                                  'https://uofcanada.edu.eg/', // Replace with actual SIS URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'SIS Schedule',
                    ),
                    Text('Schedule'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.health_and_safety,
                          size: 30), // Wellness icon
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              url:
                                  'https://outlook.office365.com/owa/calendar/WellnessBookings@microsoft.com/bookings/', // Replace with actual Microsoft Booking URL
                            ),
                          ),
                        );
                      },
                      tooltip: 'Wellness Booking',
                    ),
                    Text('Wellness'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Events content here'),
            ),
          ),
        ],
      ),
    );
  }
}
