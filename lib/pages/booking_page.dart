import 'package:eventmanagementsystem/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/components/CustomBottomNavigationBar.dart'; // Adjust the import as needed

class BookingPage extends StatefulWidget {
  final Map<String, String> event;

  const BookingPage({super.key, required this.event});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  int _ticketCount = 1;

  // List to store booking details
  final List<Map<String, dynamic>> _bookingDetailsList = [];

void _confirmBooking() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    // Debugging: Print event details to ensure they are not null
  

    // Capture the current date as the booking date
    final currentBookingDate = DateTime.now(); // Current date and time

    final bookingDetails = {
      'event': {
        'title': widget.event['title'],
        'location': widget.event['location'],
        'date': widget.event['date'], // Ensure this is not null
      },
      'bookingDate': currentBookingDate, // Current date as booking date
      'name': _name, // User's name
      'email': _email, // User's email
      'ticketCount': _ticketCount, // Number of tickets booked
    };

    // Add booking to the list
    _bookingDetailsList.add(bookingDetails);

    // Navigate to CustomBottomNavigationBar, passing available events and bookings
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CustomBottomNavigationBar(
          bookingDetails: _bookingDetailsList,
        ),
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.event["title"]}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.event["title"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.event["location"]!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Name
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Your Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Email
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Your Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Ticket count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Ticket Count'),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_ticketCount > 1) {
                                  _ticketCount--;
                                }
                              });
                            },
                          ),
                          Text('$_ticketCount'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _ticketCount++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Book Button
                  ElevatedButton(
                    onPressed: _confirmBooking,
                    child: const Text('Book Now'),
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
