import 'package:flutter/material.dart';

/// Page indicator widget showing 3 dots
/// Requirements: 2.4, 3.4, 4.4, 5.4
class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    this.pageCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 12 : 8,
          height: index == currentIndex ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? const Color(0xFFFFB800) // Active: yellow/orange
                : Colors.grey.shade300,    // Inactive: grey
          ),
        ),
      ),
    );
  }
}
