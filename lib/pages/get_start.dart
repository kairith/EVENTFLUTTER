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
            SvgPicture.asset('assets/images/event-logo.svg'), // Updated line
            const SizedBox(height: 20),
            const Text("Event Management System"),
            const SizedBox(height: 100),
            ElevatedButton(onPressed: () {
                // Navigate to LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }, child: const Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
