import 'package:flutter/material.dart';

class ColumnLayoutScreen extends StatelessWidget {
  const ColumnLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Layout')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              5,
              (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[200 + (index % 3) * 100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )),
        ),
      ),
    );
  }
}
