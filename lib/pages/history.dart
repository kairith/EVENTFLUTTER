import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookingDetailsList;

  const HistoryPage({Key? key, required this.bookingDetailsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bookingDetailsList.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Booking History')),
        body: const Center(child: Text('No booking details available.')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Booking History')),
      body: ListView.builder(
        itemCount: bookingDetailsList.length,
        itemBuilder: (context, index) {
          final bookingDetails = bookingDetailsList[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event: ${bookingDetails['event']['title']}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('Booking Successfully',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Location: ${bookingDetails['event']['location']}'),
                const SizedBox(height: 10),
                Text(
                    'Date of Booking: ${bookingDetails['bookingDate'] ?? 'Not specified'}'),
                const SizedBox(height: 10),
                Text('Name: ${bookingDetails['name']}'),
                const SizedBox(height: 10),
                Text('Email: ${bookingDetails['email']}'),
                const SizedBox(height: 10),
                Text('Tickets: ${bookingDetails['ticketCount']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
