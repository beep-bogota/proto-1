import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.lightBlue,
              child: Icon(Icons.person, size: 50, color: AppTheme.primaryBlue),
            ),
            const SizedBox(height: 16),
            Text(
              'Student Name',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppTheme.primaryBlue),
            ),
            const SizedBox(height: 8),
            Text(
              'student@university.edu',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
