import 'package:eventmanagementsystem/pages/EventCard.dart';
import 'package:flutter/material.dart';

class EventCategoryPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> events;

  const EventCategoryPage({
    Key? key,
    required this.title,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: events.isEmpty
          ? Center(child: Text("No events available"))
          : ListView(
              padding: EdgeInsets.all(8.0),
              children: events.map((event) {
                return EventCard(
                  imageUrl: event['imageUrl']!,
                  title: event['title']!,
                  location: event['location']!,
                  buttonText: "Book Now", // Change based on category
                );
              }).toList(),
            ),
    );
  }
}
