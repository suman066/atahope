import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class s4 extends StatefulWidget {
  const s4({super.key});

  @override
  State<s4> createState() => _s4State();
}

class _s4State extends State<s4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image (logo or icon)
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: const Text(
                  "CAFÉ\nDE\nPARIS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Cafe de Paris",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomSwitch(
              value: false,
              onChanged: (val) {
                debugPrint('Dark mode: $val');
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.s5);
                },
                child: Image.asset(
                  "assets/images/s4.png",
                  fit: BoxFit.cover, // fills the entire space
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
