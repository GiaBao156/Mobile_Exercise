import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Detail')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'The '),
                TextSpan(
                  text: 'quick ',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: 'Brown',
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '\nfox '),
                TextSpan(text: 'jumps ', style: TextStyle(letterSpacing: 4)),
                TextSpan(
                  text: 'over ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\nthe ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: 'lazy ',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(text: 'dog.'),
              ],
            ),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
