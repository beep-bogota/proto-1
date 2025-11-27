import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications, color: AppTheme.primaryBlue),
            title: const Text('Notifications'),
            trailing: Switch(value: true, onChanged: (val) {}, activeColor: AppTheme.accentBlue),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: AppTheme.primaryBlue),
            title: const Text('Language'),
            subtitle: const Text('English'),
          ),
          ListTile(
            leading: const Icon(Icons.info, color: AppTheme.primaryBlue),
            title: const Text('About Beep'),
            subtitle: const Text('Version 1.0.0'),
          ),
        ],
      ),
    );
  }
}
