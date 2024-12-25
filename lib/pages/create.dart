import 'package:eventmanagementsystem/database/database_helper.dart';
import 'package:eventmanagementsystem/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementsystem/model/event_model.dart'; // Import the enum
import 'package:image_picker/image_picker.dart';

enum EventCategory { Featured, Trending, Popular }

extension EventCategoryExtension on EventCategory {
  String get name {
    switch (this) {
      case EventCategory.Featured:
        return 'Featured';
      case EventCategory.Trending:
        return 'Trending';
      case EventCategory.Popular:
        return 'Popular';
      default:
        return '';
    }
  }
}

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String location = '';
  String imageUrl = '';
  DateTime? eventDate; // Changed to nullable
  EventCategory selectedCategory = EventCategory.Featured; // Default category

  final List<String> imageUrls = [
    "assets/images/National-Live-Creative-Day.jpg",
    "assets/images/people-excellence.png",
    "assets/images/MF4-Music-Festival-in-Cambodia.jpg",
    "assets/images/techno.jpg",
    "assets/images/food.jpg",
    "assets/images/AUPP-Home.jpg",
    "assets/images/CADT_location.jpg"
  ];

  final List<EventCategory> categories = EventCategory.values;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: eventDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        eventDate = picked; // Set the picked date
      });
    }
  }
  
  void createEvent() async {
  // Sample event data
  Map<String, dynamic> eventData = {
    'title': 'Sample Event',
    'location': 'New York',
    'date': '2024-12-25',
  };

  // Insert event into the database
  int eventId = await DatabaseHelper.instance.insertEvent(eventData);
  print('Event created with ID: $eventId');
}

  void _clearDate() {
    setState(() {
      eventDate = null; // Clear the date
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Event Title Input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Event Title'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Event Location Input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Event Location'),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Event Date Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eventDate != null 
                      ? "Date: ${eventDate!.toLocal().toString().split(' ')[0]}"
                      : "No date selected",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => _selectDate(context),
                        child: const Text('Select Date'),
                      ),
                      if (eventDate != null) // Show clear button only if date is selected
                        TextButton(
                          onPressed: _clearDate,
                          child: const Text('Clear Date'),
                        ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Image Selection Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Event Image'),
                value: imageUrl.isEmpty ? null : imageUrl,
                onChanged: (newValue) {
                  setState(() {
                    imageUrl = newValue!;
                  });
                },
                items: imageUrls.map((url) {
                  return DropdownMenuItem<String>(
                    value: url,
                    child: Text(url.split('/').last),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an image';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Category Selection Dropdown
              DropdownButtonFormField<EventCategory>(
                decoration: const InputDecoration(labelText: 'Event Category'),
                value: selectedCategory,
                onChanged: (newCategory) {
                  setState(() {
                    selectedCategory = newCategory!;
                  });
                },
                items: categories.map((category) {
                  return DropdownMenuItem<EventCategory>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && imageUrl.isNotEmpty) {
                    // Return the new event with the category to HomePage
                    final newEvent = {
                      "title": title,
                      "location": location,
                      "imageUrl": imageUrl,
                      "date": eventDate != null ? eventDate!.toIso8601String() : null, // Handle null date
                      "category": selectedCategory.name,  // Add category to event
                    };
                    Navigator.pop(context, newEvent); // Ensure this returns the new event
                  }
                },
                child: const Text('Save Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}