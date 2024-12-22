// Inside UpdateEventPage.dart
import 'package:flutter/material.dart';

class UpdateEventPage extends StatefulWidget {
  final Map<String, String> eventDetails;
  final Function(Map<String, String>) onUpdate;

  const UpdateEventPage({
    Key? key,
    required this.eventDetails,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _UpdateEventPageState createState() => _UpdateEventPageState();
}

class _UpdateEventPageState extends State<UpdateEventPage> {
  late TextEditingController titleController;
  late TextEditingController locationController;
  late TextEditingController imageUrlController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.eventDetails['title']);
    locationController =
        TextEditingController(text: widget.eventDetails['location']);
    imageUrlController =
        TextEditingController(text: widget.eventDetails['imageUrl']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Event Title"),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: "Event Location"),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedEvent = {
                  "id": widget.eventDetails['id']!, // Keep the same ID
                  "title": titleController.text,
                  "location": locationController.text,
                  "imageUrl": imageUrlController.text,
                };
                widget.onUpdate(updatedEvent);  // Call onUpdate
                Navigator.pop(context);  // Close the page after update
              },
              child: const Text("Update Event"),
            ),
          ],
        ),
      ),
    );
  }
}
