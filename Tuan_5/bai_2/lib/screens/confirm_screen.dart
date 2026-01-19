import 'package:flutter/material.dart';
import '../widgets/uth_logo.dart';
import '../widgets/custom_button.dart';
import '../models/account_info.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String code;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });

  void _onSubmit(BuildContext context) {
    // Tạo AccountInfo và trả về màn hình trước
    final accountInfo = AccountInfo(
      email: email,
      code: code,
      password: password,
    );

    Navigator.pop(context, accountInfo);
  }

  Widget _buildInfoRow(IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 20),
          const SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mask password for display
    final maskedPassword = '*' * password.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const UthLogo(),
              const SizedBox(height: 40),
              const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We are here to help you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              // Display collected data
              _buildInfoRow(Icons.person_outline, email),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.dialpad, code),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.lock_outline, maskedPassword),
              const Spacer(),
              CustomButton(
                text: 'Summit',
                onPressed: () => _onSubmit(context),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
