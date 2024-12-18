import 'package:eventmanagementsystem/pages/EventCategoryPage.dart';
import 'package:flutter/material.dart';
import 'create.dart'; // Import the page to create events
import 'SectionHeader.dart'; // Import the SectionHeader widget
import 'EventCard.dart'; // Import the EventCard widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Event categories
  List<Map<String, String>> featuredEvents = [
    {
      "title": "National Creativity",
      "location": "California, USA",
      "imageUrl": "assets/images/National-Live-Creative-Day.jpg",
    },
  ];
  List<Map<String, String>> trendingEvents = [
    {
      "title": "Business Party",
      "location": "Mesa, New Jersey",
      "imageUrl": "assets/images/people-excellence.png",
    },
    {
      "title": "Music Festival",
      "location": "Shiloh, Hawaii",
      "imageUrl": "assets/images/MF4-Music-Festival-in-Cambodia.jpg",
    },
  ];
  List<Map<String, String>> popularEvents = [
    {
      "title": "Art Exhibition",
      "location": "Paris, France",
      "imageUrl": "assets/images/art.jpg",
    },
  ];

  // TextEditingController for the search input
  TextEditingController searchController = TextEditingController();

  // Method to filter events based on search query
  List<Map<String, String>> _filterEvents(String query) {
    final allEvents = [...featuredEvents, ...trendingEvents, ...popularEvents];
    return allEvents.where((event) {
      final titleLower = event["title"]!.toLowerCase();
      final locationLower = event["location"]!.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower) || locationLower.contains(queryLower);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredEvents = _filterEvents(searchController.text);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.event, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "All Upcoming Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Search Bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search events by name or location...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
                setState(() {}); // Refresh the UI when the search input changes
              },
            ),

            const SizedBox(height: 16),
           
            // Display filtered events if any
            if (filteredEvents.isNotEmpty) ...[
              // Featured Events Section
              SectionHeader(
                title: "Search Results",
                onViewAll: () {},
              ),
              const SizedBox(height: 10),
              // Events container
              SizedBox(
                height: 220, // Adjust height to fit the cards
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: filteredEvents.map((event) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 250,
                      child: EventCard(
                        imageUrl: event['imageUrl']!,
                        title: event['title']!,
                        location: event['location']!,
                        buttonText: "Book Now",
                      ),
                    );
                  }).toList(),
                ),
              ),
            ] else ...[
              // If no events found
              Text(
                "No events found",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],

            const SizedBox(height: 16),

            // Featured Events Section
            SectionHeader(
              title: "Featured Events",
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventCategoryPage(
                      title: "Featured Events",
                      events: featuredEvents,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // Featured events container
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: featuredEvents.map((event) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 250,
                    child: EventCard(
                      imageUrl: event['imageUrl']!,
                      title: event['title']!,
                      location: event['location']!,
                      buttonText: "Book Now",
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Trending Events Section
            SectionHeader(
              title: "Trending Events",
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventCategoryPage(
                      title: "Trending Events",
                      events: trendingEvents,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // Trending events container
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: trendingEvents.map((event) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 200,
                    child: EventCard(
                      imageUrl: event['imageUrl']!,
                      title: event['title']!,
                      location: event['location']!,
                      buttonText: "Join",
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // Popular Events Section
            SectionHeader(
              title: "Popular Events",
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventCategoryPage(
                      title: "Popular Events",
                      events: popularEvents,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // Popular events displayed in a Column with circular images
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: popularEvents.length,
                itemBuilder: (context, index) {
                  final event = popularEvents[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            event['imageUrl']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event['location']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ElevatedButton(
                              onPressed: () {
                                // Handle action
                              },
                              child: const Text("Explore"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final newEvent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateEventPage()),
    );
    if (newEvent != null) {
      // Add the new event to the Featured, Trending, or Popular list based on its category
      setState(() {
        if (newEvent['category'] == 'Featured') {
          featuredEvents.add({
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
          });
        } else if (newEvent['category'] == 'Trending') {
          trendingEvents.add({
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
          });
        } else if (newEvent['category'] == 'Popular') {
          popularEvents.add({
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
          });
        }
      });
    }
  },
  child: const Icon(Icons.add),
  tooltip: 'Add New Event',
  backgroundColor: Colors.blue,
),

    );
  }
}