import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final Map<String, dynamic> bookingDetails;

  const HistoryPage({Key? key, required this.bookingDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure bookingDetails is not null
    if (bookingDetails.isEmpty || bookingDetails['event'] == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: const Text('No booking details available.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Booking History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event: ${bookingDetails['event']['title']}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Location: ${bookingDetails['event']['location']}'),
            const SizedBox(height: 10),
            Text('Date: ${bookingDetails['event']['date']}'),
            const SizedBox(height: 10),
            Text('Name: ${bookingDetails['name']}'),
            const SizedBox(height: 10),
            Text('Email: ${bookingDetails['email']}'),
            const SizedBox(height: 10),
            Text('Tickets: ${bookingDetails['ticketCount']}'),
          ],
        ),
      ),
    );
  }
}