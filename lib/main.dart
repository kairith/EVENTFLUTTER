// import 'package:eventmanagementsystem/components/CustomBottomNavigationBar.dart';
import 'package:eventmanagementsystem/database/testDatabase.dart';
import 'package:eventmanagementsystem/pages/get_start.dart';
import 'package:eventmanagementsystem/showData.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/database/database_helper.dart';

void main() {
  runApp(const MyApp());
}


void fetchEvents() async {
  List<Map<String, dynamic>> events = await DatabaseHelper.instance.getAllEvents();
  print('All Events: $events');
}

void fetchBookings() async {
  List<Map<String, dynamic>> bookings = await DatabaseHelper.instance.getAllBookings();
  print('All Bookings: $bookings');
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Getstart(),
    );
  }
}