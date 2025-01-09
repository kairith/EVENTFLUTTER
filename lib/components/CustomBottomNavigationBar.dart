import 'package:eventmanagementsystem/pages/History.dart';
import 'package:eventmanagementsystem/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/pages/home_page.dart';
import 'package:eventmanagementsystem/pages/notification.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  
  final List<Map<String, dynamic>>? bookingDetails; // Change to a list

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
    _pages = [
      const HomePage(),
      NotificationsPage(),
      HistoryPage(bookingDetailsList: widget.bookingDetails ?? []), // Pass the list
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