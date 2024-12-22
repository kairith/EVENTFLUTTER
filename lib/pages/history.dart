import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookings;

  const HistoryPage({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          final event = booking['event'];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(event['title']),
              subtitle: Text('Tickets: ${booking['ticketCount']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Optionally, you can implement event deletion here
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
