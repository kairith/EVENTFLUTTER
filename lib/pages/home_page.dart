import 'package:flutter/material.dart';

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
                    imageUrl: "https://via.placeholder.com/150",
                    title: "Business Party",
                    location: "Mesa, New Jersey",
                    buttonText: "Join",
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

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String buttonText;

  const EventCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 8)],
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingEventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String buttonText;

  const TrendingEventCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    minimumSize: const Size(40, 20),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
