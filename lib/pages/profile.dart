import 'package:eventmanagementsystem/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Profile Picture and Info
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/Userprofile.jpg'),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 16),
                        onPressed: () {
                          // Handle profile picture edit
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "CHANNROY CHANNDARARITH",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Username : Kairith ",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  "kairith12@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle edit profile
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Edit Profile"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Options List
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text("Favourites"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Favourites
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text("Downloads"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Downloads
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Languages"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Languages
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Location"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Location
              },
            ),
            ListTile(
              leading: const Icon(Icons.subscriptions),
              title: const Text("Subscription"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Subscription
              },
            ),
            ListTile(
              leading: const Icon(Icons.display_settings),
              title: const Text("Display"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Display
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("Clear Cache"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle Clear Cache
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Clear History"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle Clear History
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Log Out"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()), // Navigate to login page
                            );
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 16),
            const Text(
              "...",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
