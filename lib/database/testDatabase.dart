import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/database/database_helper.dart';

void main() {
  runApp(DatabaseTest());
}

class DatabaseTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database Test',
      home: Scaffold(
        appBar: AppBar(title: Text('Database Test')),
        body: DatabaseTestPage(),
      ),
    );
  }
}

class DatabaseTestPage extends StatefulWidget {
  @override
  _DatabaseTestPageState createState() => _DatabaseTestPageState();
}

class _DatabaseTestPageState extends State<DatabaseTestPage> {
  String _connectionStatus = "Testing connection...";

  @override
  void initState() {
    super.initState();
    _testDatabaseConnection();
  }

  // Method to test the database connection
  Future<void> _testDatabaseConnection() async {
    try {
      // Try fetching data or inserting a dummy record
      List<Map<String, dynamic>> events = await DatabaseHelper.instance.getAllEvents();

      // If no exception occurred, update status to success
      setState(() {
        if (events.isEmpty) {
          _connectionStatus = "Database is connected, but no events";
        } else {
          _connectionStatus = "Database is connected, and data was retrieved!";
        }
      });
    } catch (e) {
      // If an exception occurs, update status to error
      setState(() {
        _connectionStatus = "Database connection failed: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _connectionStatus,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
