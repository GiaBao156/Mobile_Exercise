import 'package:flutter/material.dart';

class PasswordFieldScreen extends StatefulWidget {
  const PasswordFieldScreen({super.key});

  @override
  State<PasswordFieldScreen> createState() => _PasswordFieldScreenState();
}

class _PasswordFieldScreenState extends State<PasswordFieldScreen> {
  bool _obscure = true;
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Field')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              obscureText: _obscure,
              decoration: InputDecoration(
                hintText: 'Nhập mật khẩu',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon:
                      Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              onChanged: (val) => setState(() => value = val),
            ),
            const SizedBox(height: 16),
            Text('Mật khẩu: $value'),
          ],
        ),
      ),
    );
  }
}
