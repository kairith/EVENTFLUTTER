import 'package:eventmanagementsystem/components/CustomBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/pages/History.dart'; // Ensure this path is correct

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

  void _confirmBooking() {
   // Inside _confirmBooking method in BookingPage
if (_formKey.currentState!.validate()) {
  _formKey.currentState!.save();

  // Save the booking details
  final bookingDetails = {
    'event': widget.event,
    'name': _name,
    'email': _email,
    'ticketCount': _ticketCount,
  };

  // Navigate to CustomBottomNavigationBar with booking details
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => CustomBottomNavigationBar(bookingDetails: bookingDetails), // Pass booking details
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