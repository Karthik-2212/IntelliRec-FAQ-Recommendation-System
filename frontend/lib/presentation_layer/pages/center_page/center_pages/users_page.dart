import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  final double width;

  const UsersPage({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Alice Johnson', 'role': 'Software Engineer', 'company': 'Google'},
      {'name': 'Bob Smith', 'role': 'Full Stack Developer', 'company': 'Amazon'},
      {'name': 'Carol Lee', 'role': 'Data Scientist', 'company': 'Meta'},
      {'name': 'David Patel', 'role': 'DevOps Engineer', 'company': 'Microsoft'},
      {'name': 'Emma Davis', 'role': 'Backend Developer', 'company': 'Oracle'},
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A0F2C), Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Active Users",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00BFFF),
              shadows: [
                Shadow(
                  blurRadius: 30,
                  color: Color(0xFF00BFFF),
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      user['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${user['role']} at ${user['company']}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF00BFFF),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
