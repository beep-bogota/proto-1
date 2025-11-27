import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beep Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.go('/home/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.go('/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Section
            Text(
              'Hello, Student',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.primaryBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Where are you going today?',
              style: TextStyle(color: AppTheme.mediumGrey),
            ),
            const SizedBox(height: 32),

            // Quick Actions Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _HomeCard(
                    icon: Icons.map,
                    title: 'View Map',
                    onTap: () => context.go('/home/map'),
                  ),
                  _HomeCard(
                    icon: Icons.schedule,
                    title: 'Schedules',
                    onTap: () {}, // TODO: Implement Schedule
                  ),
                  _HomeCard(
                    icon: Icons.directions_bus,
                    title: 'My Trips',
                    onTap: () => context.go('/home/trips'),
                  ),
                  _HomeCard(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () => context.go('/home/settings'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.lightBlue,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppTheme.primaryBlue),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
