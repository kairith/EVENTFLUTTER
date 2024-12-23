import 'package:eventmanagementsystem/pages/History.dart';
import 'package:eventmanagementsystem/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/pages/home_page.dart';
import 'package:eventmanagementsystem/pages/notification.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Map<String, dynamic>? bookingDetails; // Add this parameter

  const CustomBottomNavigationBar({super.key, this.bookingDetails});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  // List of pages
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize pages, passing booking details to HistoryPage
    _pages = [
      const HomePage(),
      NotificationsPage(),
      HistoryPage(bookingDetails: widget.bookingDetails ?? {}), // Pass booking details
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}