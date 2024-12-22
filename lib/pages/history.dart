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
      body: bookings.isEmpty
          ? const Center(
              child: Text(
                'No bookings yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                final event = booking['event'] as Map<String, String>;
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(event['title'] ?? 'Unknown Event'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${event['location']}'),
                        Text('Name: ${booking['name']}'),
                        Text('Email: ${booking['email']}'),
                        Text('Tickets: ${booking['ticketCount']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
