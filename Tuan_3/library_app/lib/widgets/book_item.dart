import 'package:flutter/material.dart';
import '../models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final VoidCallback onChanged;

  const BookItem({super.key, required this.book, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: book.isBorrowed,
        onChanged: (_) => onChanged(),
        title: Text(book.name),
        secondary: Icon(
          Icons.book,
          color: book.isBorrowed ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
