import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';

class TripInfoScreen extends StatelessWidget {
  const TripInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: AppTheme.lightBlue,
            elevation: 0,
            child: ListTile(
              leading: const Icon(Icons.history, color: AppTheme.primaryBlue),
              title: Text('Trip #${1000 + index}'),
              subtitle: Text('Date: ${DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0]}'),
              trailing: const Icon(Icons.chevron_right, color: AppTheme.mediumGrey),
              onTap: () {
                // Details
              },
            ),
          );
        },
      ),
    );
  }
}
