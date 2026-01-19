import 'package:flutter/material.dart';

class UthLogo extends StatelessWidget {
  const UthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // UTH Logo
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.teal, width: 2),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UTH',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB71C1C),
                  ),
                ),
                Text(
                  'UNIVERSITY\nOF TRANSPORT\nHO CHI MINH CITY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 5,
                    color: Colors.teal,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'SmartTasks',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}
