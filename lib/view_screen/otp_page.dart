import 'dart:async';

import 'package:atahope/Constants/constants.dart';
import 'package:atahope/bloc/otp_verify_bloc/otp_verify_bloc.dart';
import 'package:atahope/bloc/otp_verify_bloc/verify_otp_event.dart';
import 'package:atahope/view_screen/custom_appbar.dart';
import 'package:atahope/view_screen/custom_bottom_nav.dart';
import 'package:atahope/view_screen/hive_db_provider.dart';
import 'package:atahope/view_screen/login_page.dart';
import 'package:atahope/view_screen/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show read;

import '../model/signup_model.dart';


class OTPOnboardingScreen extends StatefulWidget {
  const OTPOnboardingScreen({super.key});

  @override
  State<OTPOnboardingScreen> createState() => _OTPOnboardingScreenState();
}

class _OTPOnboardingScreenState extends State<OTPOnboardingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Page 1 → your form
    OTPPage(),

    // Page 2 → example
    LoginPage(),

    // Page 3 → example
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBack: true,),
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


class OTPPage extends StatefulWidget {

  const OTPPage();

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final int length = 6;
  late List<TextEditingController> ctrls;
  late List<FocusNode> fns;
  String _name = 'USER';
  // --- Colors used to mimic the sample UI ---
  static const Color kBackground = Colors.white;
  static const Color kAccent = Color(0xFFD1C09A); // soft beige/gold accent
  static const Color kField = Color(0xFFF1F1F1);
  static const Color kDarkGray = Color(0xFF4B4B4B);

  @override
  void initState() {
    super.initState();
    ctrls = List.generate(length, (_) => TextEditingController());
    fns = List.generate(length, (_) => FocusNode());
    Timer(Duration(milliseconds: 250), () => fns[0].requestFocus());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments;
    if (arg is String && arg.isNotEmpty) _name = arg.toUpperCase();
  }

  @override
  void dispose() {
    ctrls.forEach((c) => c.dispose());
    fns.forEach((f) => f.dispose());
    super.dispose();
  }

  bool get _isComplete => ctrls.every((c) => c.text.trim().isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32),
            CircleAvatar(radius: 42, backgroundColor: kAccent, child: Icon(Icons.person, size: 44)),
            SizedBox(height: 12),
            Text('OTP $_name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(length, (i) => _otpBox(i)),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: _isComplete
                  ? () async {
                Map<String, dynamic>? userData =
                await HiveDBService().hiveUserDataGet(HiveConstants.userData);

                if (userData != null) {
                  print("User Data fetched from Hive: $userData");
                  // You can also map this back to your model class
                  final userModel = Data.fromJson(userData);
                  Map<String, dynamic> params =
                  {
                    "userId": userModel.id,
                    "otp": "${ctrls[0].text}${ctrls[1].text}${ctrls[2].text}${ctrls[3].text}${ctrls[4].text}${ctrls[5].text}",
                    "uName": userModel.uName,
                    "uNickName": userModel.uNickName,
                    "uEmail": userModel.uEmail,
                    "uMobile": userModel.uMobile
                  };
                  print("params: ${params}");

                  context.read<OTPVerifyBloc>().add(OnVerifyOTPRequestEvent(params: params, isSignup: false));

                } else {
                  print("No user data found in Hive");
                }


              }
                  : null,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: _isComplete ? kAccent : kField,
                child: Icon(Icons.check, size: 28, color: _isComplete ? Colors.black : Colors.grey),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
  Future<void> getUserDetails() async {
    Map<String, dynamic>? userData =
    await HiveDBService().hiveUserDataGet(HiveConstants.userData);

    if (userData != null) {
      print("User Data fetched from Hive: $userData");
      // You can also map this back to your model class
      final userModel = Data.fromJson(userData);
      print("User Name: ${userModel.id}");
    } else {
      print("No user data found in Hive");
    }
  }
  Widget _otpBox(int i) {
    return Container(
      width: 42,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: ctrls[i],
        focusNode: fns[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(counterText: ''),
        onChanged: (v) {
          if (v.length == 1 && i + 1 < length) {
            fns[i + 1].requestFocus();
          }
          if (v.isEmpty && i - 1 >= 0) {
            fns[i - 1].requestFocus();
          }
          setState(() {});
        },
      ),
    );
  }
}
