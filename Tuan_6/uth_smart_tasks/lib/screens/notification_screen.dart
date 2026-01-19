import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'title': 'Task Due Soon', 'message': 'Complete Flutter Project is due in 2 days', 'time': '2 hours ago', 'isRead': false},
      {'title': 'Task Completed', 'message': 'You completed Buy Groceries', 'time': '5 hours ago', 'isRead': true},
      {'title': 'New Task Added', 'message': 'Study for Exam has been added', 'time': '1 day ago', 'isRead': true},
      {'title': 'Reminder', 'message': 'Don\'t forget to review your tasks', 'time': '2 days ago', 'isRead': true},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00BCD4)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications', style: TextStyle(color: Color(0xFF00BCD4), fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Mark all read', style: TextStyle(color: Color(0xFF00BCD4), fontSize: 12)),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off_outlined, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text('No notifications', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                final isRead = notif['isRead'] as bool;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: isRead ? Colors.grey[200] : const Color(0xFF00BCD4).withOpacity(0.1),
                      child: Icon(
                        Icons.notifications,
                        color: isRead ? Colors.grey : const Color(0xFF00BCD4),
                      ),
                    ),
                    title: Text(
                      notif['title'] as String,
                      style: TextStyle(
                        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notif['message'] as String, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        const SizedBox(height: 4),
                        Text(notif['time'] as String, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                      ],
                    ),
                    trailing: !isRead
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFF00BCD4),
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
    );
  }
}
