import 'package:flutter/material.dart';

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Layout')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(9, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[200 + (index % 3) * 100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
