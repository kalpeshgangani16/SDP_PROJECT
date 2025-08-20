import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HireAssist Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, ${user?.email ?? 'User'} 👋",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Example buttons or features
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to profile page
              },
              icon: const Icon(Icons.person),
              label: const Text("Profile"),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                // Navigate to job postings
              },
              icon: const Icon(Icons.work),
              label: const Text("Job Listings"),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                // Navigate to chat/assistant
              },
              icon: const Icon(Icons.chat),
              label: const Text("AI Assistant"),
            ),
          ],
        ),
      ),
    );
  }
}
