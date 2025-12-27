import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Image.network(
            'https://daotao.ut.edu.vn/wp-content/uploads/2023/10/Hinh-truong-DHGTVT-TPHCM-300x188.jpg',
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'https://daotao.ut.edu.vn/wp-content/uploads/2023/10/Hinh-truong-DHGTVT-TPHCM-300x188.jpg',
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 24),
          Image.asset('assets/uth.jpg'),
          const SizedBox(height: 8),
          const Center(child: Text('In app', style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
