import 'package:flutter/material.dart';
import 'EventCard.dart';
import 'TrendingEventCard.dart';
// import 'package:eventmanagementsystem/components/CustomBottomNavigationBar.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "Event",
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
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search events...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Featured Events Section
            SectionHeader(title: "Featured Events", onViewAll: () {}),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  EventCard(
                    imageUrl: "assets/images/National-Live-Creative-Day.jpg",
                    title: "National Creativity",
                    location: "California, USA",
                    buttonText: "Book Now",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Trending Events Section
            SectionHeader(title: "Trending Events", onViewAll: () {}),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text("All")),
                Chip(label: Text("Art")),
                Chip(label: Text("Music")),
                Chip(label: Text("Sports")),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  TrendingEventCard(
                    imageUrl: "assets/images/people-excellence.png",
                    title: "Business Party",
                    location: "Mesa, New Jersey",
                    buttonText: "Join",
                    // view the tect file and the image tof the code for card event
                    // the event can book bash on the location name of the organization date compare to the booked event of the form
                    // the event can also be viewed by the user by clicking on the event card
                  ),
                  TrendingEventCard(
                    imageUrl: "assets/images/MF4-Music-Festival-in-Cambodia.jpg",
                    title: "Music Festival",
                    location: "Shiloh, Hawaii",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "assets/images/techno.jpg",
                    title: "Tech Meetup",
                    location: "Silicon Valley, California",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "assets/images/food.jpg",
                    title: "Food Carnival",
                    location: "Austin, Texas",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "assets/images/art.jpg",
                    title: "Art Exhibition",
                    location: "Paris, France",
                    buttonText: "Join",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Popular Events Section
            SectionHeader(title: "Popular Events", onViewAll: () {}),
            // Add this part after Popular Events section
            const SizedBox(height: 10),

// Popular Events List
            ListView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Prevent inner scrolling
                 itemCount: 3, // Replace with dynamic data later
                 itemBuilder: (context, index) {
                // Event data for illustration (hardcoded here, use dynamic data as needed)
                final events = [
                  {
                    "title": "Robot Events",
                    "date": "25 July, 02:00 pm",
                    "price": "\$25.33"
                  },
                  {
                    "title": "Corporate Event",
                    "date": "27 July, 08:00 pm",
                    "price": "\$23.53"
                  },
                  {
                    "title": "Game of the year",
                    "date": "29 July, 02:00 pm",
                    "price": "\$28.99"
                  },
                ];

                final event = events[index];

                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage("assets/images/MF4-Music-Festival-in-Cambodia.jpg"),
                    ),
                    title: Text(
                      event['title']!,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(event['date']!),
                    trailing: Text(
                      event['price']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      // Navigate to event details or show more info
                      print("Tapped on ${event['title']}");
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16), // Padding after Popular Events
          ],
        ),
      ),
      //  bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({super.key, required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(onPressed: onViewAll, child: const Text("View All")),
      ],
    );
    
  }
}
