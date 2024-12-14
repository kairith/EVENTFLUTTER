import 'package:flutter/material.dart';
import 'EventCard.dart';
import 'TrendingEventCard.dart';

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
                    imageUrl: "https://via.placeholder.com/150",
                    title: "Music Festival",
                    location: "Shiloh, Hawaii",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "https://via.placeholder.com/150",
                    title: "Tech Meetup",
                    location: "Silicon Valley, California",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "https://via.placeholder.com/150",
                    title: "Food Carnival",
                    location: "Austin, Texas",
                    buttonText: "Join",
                  ),
                  TrendingEventCard(
                    imageUrl: "https://via.placeholder.com/150",
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
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionHeader({required this.title, required this.onViewAll});

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
