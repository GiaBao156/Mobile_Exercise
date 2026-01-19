import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);
    final result = await _authService.signInWithGoogle();
    setState(() => _isLoading = false);

    if (result != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thành công!'), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thất bại!'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Login-Flow',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
            
            const Spacer(flex: 2),
            
            // UTH Logo Box
            Container(
              width: 160,
              height: 160,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF00BCD4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(
                'assets/images/truong-dai-hoc-giao-thong-van-tai-tphcm.jpg',
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // SmartTasks title
            const Text(
              'SmartTasks',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BCD4),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'A simple and efficient to do app',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
            
            const Spacer(flex: 2),
            
            // Welcome section
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ready to explore? Log in to get started.',
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
            ),
            
            const SizedBox(height: 24),
            
            // Google Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Color(0xFF00BCD4))
                  : OutlinedButton(
                      onPressed: _handleGoogleSignIn,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
                            width: 20,
                            height: 20,
                            errorBuilder: (_, __, ___) => const Text('G', 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'SIGN IN WITH GOOGLE',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            
            const Spacer(flex: 3),
            
            // Footer
            Text(
              '© UTHSmartTasks',
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
