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
  DateTime? selectedDate; // Variable to hold the selected date

  final List<String> imageUrls = [
    "assets/images/National-Live-Creative-Day.jpg",
    "assets/images/people-excellence.png",
    "assets/images/MF4-Music-Festival-in-Cambodia.jpg",
    "assets/images/techno.jpg",
    "assets/images/food.jpg",
    "assets/images/AUPP-Home.jpg",
    "assets/images/CADT_location.jpg",
    "assets/images/Art.jpg",
  ];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.eventDetails['title']);
    locationController = TextEditingController(text: widget.eventDetails['location']);
    selectedImageUrl = widget.eventDetails['imageUrl'];
    selectedDate = DateTime.parse(widget.eventDetails['date']!);// Initialize with current date
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Update the selected date
      });
    }
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
            const SizedBox(height: 20),

            // Event Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null 
                    ? "Date: ${selectedDate!.toLocal().toString().split(' ')[0]}"
                    : "No date selected",
                  style: const TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dropdown for selecting an image
            DropdownButton<String>(
              value: selectedImageUrl,
              isExpanded: true,
              hint: const Text("Select an Image"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedImageUrl = newValue;
                });
              },
              items: imageUrls.map<DropdownMenuItem<String>>((String url) {
                return DropdownMenuItem<String>(
                  value: url,
                  child: Row(
                    children: [
                      Image.asset(url, width: 50, height: 50),
                      const SizedBox(width: 10),
                      Text(url.split('/').last), // Display the image file name
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final updatedEvent = {
                  "id": widget.eventDetails['id']!,
                  "title": titleController.text,
                  "location": locationController.text,
                  "imageUrl": selectedImageUrl!, // Use the selected image URL
                  "date": selectedDate?.toIso8601String() ?? "", // Ensure non-null value
                };

                widget.onUpdate(updatedEvent); // Call the update function
                Navigator.pop(context); // Close the page
              },
              child: const Text("Update Event"),
            ),
          ],
        ),
      ),
    );
  }
}