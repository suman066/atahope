
import 'package:atahope/view_screen/account_selection_page.dart';
import 'package:atahope/view_screen/custom_appbar.dart';
import 'package:atahope/view_screen/custom_bottom_nav.dart';
import 'package:atahope/view_screen/login_page.dart';
import 'package:atahope/view_screen/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Page 1 → your form
    AccountSelectionPage(),

    // Page 2 → example
    LoginPage(),

    // Page 3 → example
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
