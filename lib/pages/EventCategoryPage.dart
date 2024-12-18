import 'package:flutter/material.dart';
import 'ViewAllEventsPage.dart'; // Import your ViewAllEventsPage file

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
      body: Column(
        children: [
          if (events.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to ViewAllEventsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAllEventsPage(
                          category: title,
                          events: events,
                        ),
                      ),
                    );
                  },
                  child: const Text(""),
                ),
              ),
            ),
          Expanded(
            child: events.isEmpty
                ? const Center(child: Text("No events available"))
                : ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: events.map((event) {
                      return Card(
                        child: ListTile(
                          title: Text(event['title'] ?? "Untitled Event"),
                          subtitle: Text(event['location'] ?? ""),
                          trailing: const Text("Book Now"),
                          onTap: () {
                            // Navigate or perform action for event
                          },
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
