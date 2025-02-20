import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLocation();
  }

  Future<void> _navigateToLocation() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      AppRoutes.goToLocation(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  const Color.fromRGBO(236, 235, 231, 1),
        child: Center(
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo1.jpeg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
