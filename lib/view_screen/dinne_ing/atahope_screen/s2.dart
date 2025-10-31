import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class s2 extends StatefulWidget {
  const s2({super.key});

  @override
  State<s2> createState() => _s2State();
}

class _s2State extends State<s2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //automaticallyImplyLeading: false,
        leading: InkWell(
            onTap:(){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: const Text(
          'ATAHOPE',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[200], // circular background
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(6),
              minimumSize: const Size(24, 24),
            ),
            icon: const Icon(Icons.add, size: 24, color: Colors.black),
          ),
          const SizedBox(width: 10),
          CustomSwitch(
            value: false,
            onChanged: (val) {
              // setState(() => isDark = val);
              debugPrint('Dark mode: $val');
            },
          ),

          const SizedBox(width: 10),
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
                  Navigator.of(context).pushNamed(AppRoutes.s3);
                },
                child: Image.asset(
                  "assets/images/s2.png",
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
