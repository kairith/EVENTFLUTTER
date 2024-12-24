import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, String>> notifications = [
    {"title": "Event Reminder", "description": "Art Exhibition starts tomorrow."},
    {"title": "Booking Confirmed", "description": "You are registered for 'Music Festival'."},
    {"title": "Event Update", "description": "The location for 'Business Party' has changed."},
    {"title": "New Event Added", "description": "Don't miss 'Tech Expo' next week!"},
  ];

  Map<String, String>? _lastDeletedNotification;
  int? _lastDeletedIndex;

  void deleteNotification(int index) {
    setState(() {
      _lastDeletedNotification = notifications[index];
      _lastDeletedIndex = index;
      notifications.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Notification deleted."),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            restoreNotification();
          },
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void restoreNotification() {
    if (_lastDeletedNotification != null && _lastDeletedIndex != null) {
      setState(() {
        notifications.insert(_lastDeletedIndex!, _lastDeletedNotification!);
        _lastDeletedNotification = null;
        _lastDeletedIndex = null;
      });
    }
  }
  void reorderNotifications(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex--;
      }
      final notification = notifications.removeAt(oldIndex);
      notifications.insert(newIndex, notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          if (notifications.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                setState(() {
                  notifications.clear();
                });
              },
            ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No notifications yet.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ReorderableListView.builder(
              itemCount: notifications.length,
              onReorder: reorderNotifications,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Dismissible(
                  key: Key(notification["title"]!),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    deleteNotification(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.notifications, color: Colors.blue),
                      title: Text(
                        notification["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(notification["description"]!),
                      onTap: () {
                        // Handle tap action (navigate or show details)
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}