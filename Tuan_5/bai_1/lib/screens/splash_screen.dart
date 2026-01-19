import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

/// Splash screen displaying UTH SmartTasks logo
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Auto navigate after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Nền trắng
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/truong-dai-hoc-giao-thong-van-tai-tphcm.jpg',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.task_alt,
                  size: 100,
                  color: Color(0xFFFFB800),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black, // ✅ Đổi sang màu đen
              ),
            ),
          ],
        ),
      ),
    );
  }
}
