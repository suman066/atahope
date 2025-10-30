import 'package:atahope/view_screen/hive_db_provider.dart';
import 'package:atahope/view_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Add your logout logic here
            await HiveDBService().clearUserData(); // 🔹 Call your method
            // After clearing user data, navigate to login page
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const OnboardingScreen(),
                ),
                    (route) => false, // removes all previous routes
              );
            }
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
