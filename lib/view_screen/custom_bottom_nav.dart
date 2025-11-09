import 'package:atahope/Constants/constants.dart';
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
      margin: const EdgeInsets.only(left: 1, right: 1, bottom: 1, top: 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem("assets/images/bill.png", 0, activeColor: AppColors.purple),
          _buildNavItem("assets/images/check.png", 1),
          _buildCameraItem(2), // Camera special
          _buildNavItem("assets/images/message.png", 3),
          _buildNavItem("assets/images/profile.png", 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      String assetPath,
      int index, {
        Color? activeColor,
        double width = 40,
        double height = 40,
      }) {
    final bool isSelected = currentIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? (activeColor ?? AppColors.purple) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => onTap(index),
        icon: SizedBox(
          //width: width,
          //height: height,
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
            color: isSelected ? AppColors.white : AppColors.black87, // remove if no tint
          ),
        ),
        splashRadius: width, // optional
      ),
    );
  }
  Widget _buildNavItem1(
      String assetPath,
      int index, {
        Color? activeColor,
        double width = 45,
        double height = 40,
      }) {
    final bool isSelected = currentIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? (activeColor ?? AppColors.purple) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => onTap(index),
        icon: SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
            color: isSelected ? AppColors.white : null, // remove if no tint
          ),
        ),
        splashRadius: width, // optional
      ),
    );
  }


  /// Special design for the camera icon (with turquoise outline)
  Widget _buildCameraItem(int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 56,
        width:56,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            "assets/images/camera_icon.png",
            color: isSelected ? AppColors.white : null,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
