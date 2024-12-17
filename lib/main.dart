// import 'package:eventmanagementsystem/components/CustomBottomNavigationBar.dart';
import 'package:eventmanagementsystem/pages/get_start.dart';
import 'package:flutter/material.dart';
// import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Getstart(),
    );
  }
}