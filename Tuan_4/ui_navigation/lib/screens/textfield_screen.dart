import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Thông tin nhập',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => value = val),
            ),
            const SizedBox(height: 16),
            Text(
              'Tự động cập nhật dữ liệu theo textfield',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            Text('Giá trị nhập: $value'),
          ],
        ),
      ),
    );
  }
}
