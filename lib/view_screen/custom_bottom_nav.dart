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
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 16, top: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.receipt_long_outlined, 0, activeColor: Colors.purple), // Bills
          _buildNavItem(Icons.check_circle_outline, 1),
          _buildCameraItem(2), // Camera special
          _buildNavItem(Icons.chat_bubble_outline, 3),
          _buildNavItem(Icons.person_outline, 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, {Color? activeColor}) {
    final bool isSelected = currentIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? activeColor ?? Colors.purple : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => onTap(index),
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
          size: 26,
        ),
        splashRadius: 26,
      ),
    );
  }

  /// Special design for the camera icon (with turquoise outline)
  Widget _buildCameraItem(int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: Colors.tealAccent,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.camera_alt_outlined,
          color: isSelected ? Colors.black : Colors.black54,
          size: 26,
        ),
      ),
    );
  }
}
