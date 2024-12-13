import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:eventmanagementsystem/pages/login_page.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/event-logo.svg',
              width: 350,
            ), // Updated line
            const SizedBox(height: 20),
            const Text("Booking and Register Event...",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal)),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Navigate to LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0), // Padding
                textStyle: const TextStyle(
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                ),
              ),
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
