import 'package:eventmanagementsystem/pages/EventCategoryPage.dart';
import 'package:eventmanagementsystem/pages/booking_page.dart';
import 'package:flutter/material.dart';
import 'create.dart'; // Import the page to create events
import 'SectionHeader.dart'; // Import the SectionHeader widget
import '../model/EventCard.dart'; // Import the EventCard widget
import 'UpdateEvent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // Event categories
  List<Map<String, String>> featuredEvents = [
    {
      "id": "1", // Added ID for event identification
      "title": "National Creativity",
      "location": "California, USA",
      "imageUrl": "assets/images/National-Live-Creative-Day.jpg",
      "date": DateTime.now().add(Duration(days: 30)).toIso8601String(),
      
    },
  ];
  List<Map<String, String>> trendingEvents = [
    {
      "id": "2",
      "title": "Business Party",
      "location": "Mesa, New Jersey",
      "imageUrl": "assets/images/people-excellence.png",
      "date": DateTime.now().add(Duration(days: 30)).toIso8601String(),
    },
    {
      "id": "3",
      "title": "Music Festival",
      "location": "Shiloh, Hawaii",
      "imageUrl": "assets/images/MF4-Music-Festival-in-Cambodia.jpg",
      "date": DateTime.now().add(Duration(days: 30)).toIso8601String(),
    },
  ];
  List<Map<String, String>> popularEvents = [
    {
      "id": "4",
      "title": "Art Exhibition",
      "location": "Paris, France",
      "imageUrl": "assets/images/Art.jpg",
      "date": DateTime.now().add(Duration(days: 30)).toIso8601String(),
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
      return titleLower.contains(queryLower) ||
          locationLower.contains(queryLower);
    }).toList();
  }

  // Function to delete an event
  void deleteEvent(String category, Map<String, String> event) {
    setState(() {
      if (category == 'Featured') {
        featuredEvents.remove(event);
      } else if (category == 'Trending') {
        trendingEvents.remove(event);
      } else if (category == 'Popular') {
        popularEvents.remove(event);
      }
    });
  }

  // Function to handle event update
  void updateEvent(String category, Map<String, String> updatedEvent) {
    setState(() {
      if (category == 'Featured') {
        final index = featuredEvents
            .indexWhere((event) => event['id'] == updatedEvent['id']);
        if (index != -1) {
          featuredEvents[index] = updatedEvent;
        }
      } else if (category == 'Trending') {
        final index = trendingEvents
            .indexWhere((event) => event['id'] == updatedEvent['id']);
        if (index != -1) {
          trendingEvents[index] = updatedEvent;
        }
      } else if (category == 'Popular') {
        final index = popularEvents
            .indexWhere((event) => event['id'] == updatedEvent['id']);
        if (index != -1) {
          popularEvents[index] = updatedEvent;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredEvents =
        _filterEvents(searchController.text);

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

            if (filteredEvents.isNotEmpty) ...[
              SectionHeader(
                title: "Search Results",
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
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: filteredEvents.map((event) {
                    return GestureDetector(
                      onLongPress: () {
                        // Show delete confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Delete Event"),
                              content: const Text(
                                  "Do you want to delete this event?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    deleteEvent('Featured', event);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onTap: () async {
                        final updatedEvent = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateEventPage(
                              eventDetails: event,
                              onUpdate: (updatedEvent) {
                                updateEvent('Featured',
                                    updatedEvent); // Update the correct category
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        width: 250,
                        child: EventCard(
                          imageUrl: event['imageUrl']!,
                          title: event['title']!,
                          location: event['location']!,
                          date: DateTime.parse(event['date']!),
                          buttonText: 'Book Now',
                          onPressed: () {
                            if ('Book Now' == 'Book Now') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    event: {
                                      'title':event['title']!,
                                      'location': event['location']!,
                                    },
                                  ),
                                ),
                              );
                            } else if ('Learn More' == 'Learn More') {
                              print('Learn More action triggered');
                              // Navigate to an event details page if needed
                            }
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ] else ...[
              const Text(
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
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: featuredEvents.map((event) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Event"),
                            content:
                                const Text("Do you want to delete this event?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteEvent('Featured', event);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onTap: () async {
                      final updatedEvent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateEventPage(
                            eventDetails: event,
                            onUpdate: (updatedEvent) {
                              updateEvent('Featured', updatedEvent);
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 250,
                      child: EventCard(
                        imageUrl: event['imageUrl']!,
                        title: event['title']!,
                        location: event['location']!,
                        date: DateTime.parse(event['date']!),
                        buttonText: "Book Now",
                        onPressed: () {
                          if ('Book Now' == 'Book Now') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(
                                  event: {
                                    'title':event['title']!,
                                      'location': event['location']!,
                                  },
                                ),
                              ),
                            );
                          } else if ('Learn More' == 'Learn More') {
                            print('Learn More action triggered');
                            // Navigate to an event details page if needed
                          }
                        },
                      ),
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
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: trendingEvents.map((event) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Event"),
                            content:
                                const Text("Do you want to delete this event?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteEvent('Trending', event);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onTap: () async {
                      final updatedEvent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateEventPage(
                            eventDetails: event,
                            onUpdate: (updatedEvent) {
                              updateEvent('Trending', updatedEvent);
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 200,
                      child: EventCard(
                        imageUrl: event['imageUrl']!,
                        title: event['title']!,
                        location: event['location']!,
                        date: DateTime.parse(event['date']!),
                        buttonText: "Join",
                        onPressed: () {
                          if ('Join' == 'Join') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(
                                  event: {
                                    'title':event['title']!,
                                      'location': event['location']!,
                                  },
                                ),
                              ),
                            );
                          } else if ('Learn More' == 'Learn More') {
                            print('Learn More action triggered');
                            // Navigate to an event details page if needed
                          }
                        },
                      ),
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
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: popularEvents.map((event) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Event"),
                            content:
                                const Text("Do you want to delete this event?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteEvent('Popular', event);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onTap: () async {
                      final updatedEvent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateEventPage(
                            eventDetails: event,
                            onUpdate: (updatedEvent) {
                              updateEvent('Popular', updatedEvent);
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 250,
                      child: EventCard(
                        imageUrl: event['imageUrl']!,
                        title: event['title']!,
                        location: event['location']!,
                        date: DateTime.parse(event['date']!),
                        buttonText: "explore",
                        onPressed: () {
                          if ('explore' == 'explore') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(
                                  event: {
                                    'title':event['title']!,
                                      'location': event['location']!,
                                  },
                                ),
                              ),
                            );
                          } else if ('Learn More' == 'Learn More') {
                            print('Learn More action triggered');
                            // Navigate to an event details page if needed
                          }
                        },
                      ),
                    ),
                  );
                }).toList(),
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
    if (newEvent != null) { // Ensure newEvent is not null
      setState(() {
        // Add the new event to the corresponding category
        if (newEvent['category'] == 'Featured') {
          featuredEvents.add({
            "id": DateTime.now().millisecondsSinceEpoch.toString(),
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
            "date": newEvent['date'], // Ensure date is added
          });
        } else if (newEvent['category'] == 'Trending') {
          trendingEvents.add({
            "id": DateTime.now().millisecondsSinceEpoch.toString(),
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
            "date": newEvent['date'], // Ensure date is added
          });
        } else if (newEvent['category'] == 'Popular') {
          popularEvents.add({
            "id": DateTime.now().millisecondsSinceEpoch.toString(),
            "title": newEvent['title']!,
            "location": newEvent['location']!,
            "imageUrl": newEvent['imageUrl']!,
            "date": newEvent['date'], // Ensure date is added
          });
        }
      });
    }
  },
  tooltip: 'Add New Event',
  backgroundColor: Colors.blue,
  child: const Icon(Icons.add),
),
    );
  }
}
