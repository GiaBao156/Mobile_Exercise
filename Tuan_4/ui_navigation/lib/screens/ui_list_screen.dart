import 'package:flutter/material.dart';
import 'text_detail_screen.dart';
import 'image_screen.dart';
import 'textfield_screen.dart';
import 'password_field_screen.dart';
import 'column_layout_screen.dart';
import 'row_layout_screen.dart';
import 'about_screen.dart';

class UIListScreen extends StatelessWidget {
  const UIListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Components List')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Display',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          _buildTile(
            context,
            'Text',
            'Displays text',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TextDetailScreen()),
            ),
          ),
          _buildTile(
            context,
            'Image',
            'Displays an image',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ImageScreen()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Input',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          _buildTile(
            context,
            'TextField',
            'Input field for text',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TextFieldScreen()),
            ),
          ),
          _buildTile(
            context,
            'PasswordField',
            'Input field for passwords',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PasswordFieldScreen()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Layout',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          _buildTile(
            context,
            'Column',
            'Arranges elements vertically',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ColumnLayoutScreen()),
            ),
          ),
          _buildTile(
            context,
            'Row',
            'Arranges elements horizontally',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RowLayoutScreen()),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            tileColor: Colors.red[100],
            title: const Text('About'),
            subtitle: const Text('Thông tin về ứng dụng'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback? onTap, {
    bool enabled = true,
  }) {
    return Card(
      color: enabled ? Colors.blue[50] : Colors.grey[200],
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}
