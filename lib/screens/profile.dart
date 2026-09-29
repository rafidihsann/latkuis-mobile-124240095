import 'package:flutter/material.dart';

import '../models/data.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 64,
            backgroundColor: const Color(0xFFE9DDFF),
            child: Icon(Icons.person, size: 90, color: Colors.deepPurple[700]),
          ),
          const SizedBox(height: 12),
          Text('Username', style: TextStyle(color: Colors.grey[500])),
          const SizedBox(height: 2),
          Text(
            user1.username,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(user1.name, style: TextStyle(color: Colors.grey[700])),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, size: 16),
            label: const Text('Logout'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurple[400],
              backgroundColor: const Color(0xFFF8F4FF),
              side: BorderSide(color: Colors.deepPurple.shade100),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    );
  }
}
