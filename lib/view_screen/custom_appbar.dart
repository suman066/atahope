import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final bool isBack;
  const CustomAppbar({super.key, this.isBack = false});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool switch1 = false;
  bool switch2 = false;


  // 🔹 Colors
  static const Color kAccent = Color(0xFFD1C09A);

  // 🔹 ValueNotifiers
  final ValueNotifier<bool> isDark = ValueNotifier(false);
  final ValueNotifier<bool> isEnglish = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                !widget.isBack ? const SizedBox() : IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: isDark,
                  builder: (context, value, _) {
                    return CustomSwitch(
                      value: value,
                      onChanged: (val) {
                        // isDark.value = val;
                      },
                      activeIcon: const Icon(Icons.nightlight_round, color: Colors.white),
                      inactiveIcon: const Icon(Icons.wb_sunny, color: Colors.white),
                    );
                  },
                ),
              ],
            ),

            GestureDetector(
              onTap: () => isEnglish.value = !isEnglish.value,
              child: ValueListenableBuilder(
                valueListenable: isEnglish,
                builder: (context, eng, _) {
                  return Container(
                    decoration: BoxDecoration(
                      color: eng ? Colors.grey.shade200 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(Icons.translate,color: eng ? Colors.red : Colors.black),
                          const SizedBox(width: 5),
                          Icon(Icons.flag,
                              color: eng ? Colors.black : Colors.red),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
