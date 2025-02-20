import 'package:flutter/material.dart';
import '../widgets/login_screen.dart';
import '../widgets/register_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'SIGN IN OR REGISTER',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(const Color(0xFFB71C1C)),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(const Color(0xFFB71C1C)),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'REGISTER AN ACCOUNT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Automatically show the auth dialog when this screen is loaded
    Future.delayed(Duration.zero, () {
      _showAuthDialog(context);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB71C1C),
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home', // Home screen route
                  (route) => false, // Clear the stack
            );
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
