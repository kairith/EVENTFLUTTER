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
  String? selectedImageUrl;

  // List of image options
  final List<String> imageOptions = [
    'assets/images/National-Live-Creative-Day.jpg',
    'assets/images/people-excellence.png',
    'assets/images/MF4-Music-Festival-in-Cambodia.jpg',
    'assets/images/art.jpg',
  ];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.eventDetails['title']);
    locationController =
        TextEditingController(text: widget.eventDetails['location']);
    selectedImageUrl = widget.eventDetails['imageUrl'];
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
            // Title TextField
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Event Title"),
            ),
            // Location TextField
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: "Event Location"),
            ),
            // Dropdown for selecting Image
            DropdownButton<String>(
              value: selectedImageUrl,
              hint: const Text("Select Image"),
              isExpanded: true,
              items: imageOptions.map((imageUrl) {
                return DropdownMenuItem<String>(
                  value: imageUrl,
                  child: Row(
                    children: [
                      Image.asset(imageUrl, width: 50, height: 50), // Displaying the image in the dropdown
                      const SizedBox(width: 10),
                      Text(imageUrl.split('/').last), // Display the image filename
                    ],
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedImageUrl = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedImageUrl != null) {
                  final updatedEvent = {
                    "id": widget.eventDetails['id'] ?? 'default_id', // Use a default id if null
                    "title": titleController.text,
                    "location": locationController.text,
                    "imageUrl": selectedImageUrl!,
                  };
                  widget.onUpdate(updatedEvent); // Call onUpdate
                  Navigator.pop(context); // Close the page after update
                } else {
                  // Show an alert if no image is selected
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please select an image.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text("Update Event"),
            ),
          ],
        ),
      ),
    );
  }
}
