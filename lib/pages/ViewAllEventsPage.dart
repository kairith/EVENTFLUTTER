import 'package:flutter/material.dart';

class ViewAllEventsPage extends StatelessWidget {
  final String category;
  final List<Map<String, String>> events;

  const ViewAllEventsPage({
    super.key,
    required this.category,
    required this.events,
  });

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$category Events"),
      ),
      body: events.isEmpty
          ? const Center(
              child: Text("No events available."),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];

                
                final title = event["title"] ?? "Untitled Event";
                final location = event["location"];
                final date = event["date"];
                final price = event["price"];

                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        title.isNotEmpty ? title[0] : '?', // First letter or default '?'
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: location != null
                        ? Text(location)
                        : (date != null ? Text(date) : const SizedBox.shrink()),
                    trailing: price != null
                        ? Text(
                            price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 14,
                            ),
                          )
                        : null,
                    onTap: () {
                      // You can navigate to another screen to show event details, for example:
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => EventDetailsPage(event: event),
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
    );
  }
}
