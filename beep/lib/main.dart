import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase here if using real auth
  // await Firebase.initializeApp();

  runApp(const ProviderScope(child: BeepApp()));
}

class BeepApp extends ConsumerWidget {
  const BeepApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Beep',
      theme: AppTheme.theme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
