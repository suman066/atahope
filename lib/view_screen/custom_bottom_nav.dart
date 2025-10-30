import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNav({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 75, right: 70, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(Icons.check_circle_outline, 0),
          _buildNavItem(Icons.person_outline, 1),
          _buildNavItem(Icons.settings_outlined, 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.black54,
      ),
      splashRadius: 24,
    );
  }
}
