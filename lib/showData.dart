import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/database/database_helper.dart'; // Import your database helper

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Map<String, dynamic>> events = [];
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
    fetchBookings();
  }

  void fetchEvents() async {
    List<Map<String, dynamic>> eventsData = await DatabaseHelper.instance.getAllEvents();
    setState(() {
      events = eventsData;
    });
    print('All Events: $events');
  }

  void fetchBookings() async {
    List<Map<String, dynamic>> bookingsData = await DatabaseHelper.instance.getAllBookings();
    setState(() {
      bookings = bookingsData;
    });
    print('All Bookings: $bookings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Management')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display events
            Text('Events:'),
            for (var event in events)
              ListTile(
                title: Text(event['title']),
                subtitle: Text(event['location']),
              ),
            // Display bookings
            Text('Bookings:'),
            for (var booking in bookings)
              ListTile(
                title: Text(booking['userName']),
                subtitle: Text(booking['userEmail']),
              ),
          ],
        ),
      ),
    );
  }
}
