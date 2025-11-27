import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/theme/app_theme.dart';
import '../../data/auth_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Access the auth service via provider (stub for now)
      final authService = ref.read(authServiceProvider);

      // Simulate login flow
      await authService.signInWithMicrosoft();

      if (mounted) {
        // Navigate to Home upon success
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed: $e'),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Placeholder
              const Icon(
                Icons.directions_bus_filled,
                size: 80,
                color: AppTheme.primaryBlue
              ),
              const SizedBox(height: 16),
              Text(
                'BEEP',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'University Transport App',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 48),

              // Login Button
              ElevatedButton.icon(
                onPressed: _isLoading ? null : _handleLogin,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      )
                    : const Icon(Icons.login),
                label: const Text('Login with Outlook'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Use your university credentials to sign in.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.mediumGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
