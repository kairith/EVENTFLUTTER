import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper instance = DatabaseHelper._constructor();

  DatabaseHelper._constructor();

  Future<Database> _getDatabase() async {
  final databasesPath = await getDatabasesPath();
  final dbPath = join(databasesPath, 'Event_management_system.db');
  return openDatabase(
    dbPath, 
    version: 1, 
    onCreate: (db, version) {
      // Create the tables on database creation
      db.execute('''
        CREATE TABLE Events (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          location TEXT,
          date TEXT
        )
      ''');

      db.execute('''
        CREATE TABLE Bookings (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          eventId INTEGER,
          userName TEXT,
          userEmail TEXT,
          FOREIGN KEY(eventId) REFERENCES Events(id)
        )
      ''');
    }
  );
}


  // Insert a new event
  Future<int> insertEvent(Map<String, dynamic> eventData) async {
    Database db = await _getDatabase();
    return await db.insert('Events', eventData);
  }

  // Insert a booking
  Future<int> insertBooking(Map<String, dynamic> bookingData) async {
    Database db = await _getDatabase();
    return await db.insert('Bookings', bookingData);
  }

  // Fetch all events
  Future<List<Map<String, dynamic>>> getAllEvents() async {
    Database db = await _getDatabase();
    return await db.query('Events');
  }

  // Fetch all bookings
  Future<List<Map<String, dynamic>>> getAllBookings() async {
    Database db = await _getDatabase();
    return await db.query('Bookings');
  }
}


void main() async {
  // Initialize the database (this will automatically create the tables if not already created)
  await DatabaseHelper.instance._getDatabase();
  
  // Optional: Call functions to verify or test the database
  await testDatabase();
}

Future<void> testDatabase() async {
  // Insert a test event
  Map<String, dynamic> event = {
    'title': 'Sample Event',
    'location': 'New York',
    'date': '2024-12-25'
  };
  await DatabaseHelper.instance.insertEvent(event);
  
  // Insert a test booking
  Map<String, dynamic> booking = {
    'eventId': 1,  // Assuming the eventId is 1 for the test event
    'userName': 'John Doe',
    'userEmail': 'john.doe@example.com'
  };
  await DatabaseHelper.instance.insertBooking(booking);
  
  // Fetch and print all events
  List<Map<String, dynamic>> events = await DatabaseHelper.instance.getAllEvents();
  print('All Events: $events');
  
  // Fetch and print all bookings
  List<Map<String, dynamic>> bookings = await DatabaseHelper.instance.getAllBookings();
  print('All Bookings: $bookings');
}
