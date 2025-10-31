import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Check Page",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
