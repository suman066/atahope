import 'dart:async';
import 'package:atahope/bloc/Login_bloc/login_bloc.dart';
import 'package:atahope/bloc/Login_bloc/login_event.dart';
import 'package:atahope/view_screen/custom_appbar.dart';
import 'package:atahope/view_screen/custom_bottom_nav.dart';
import 'package:atahope/view_screen/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginOnboardingScreen extends StatefulWidget {
  const LoginOnboardingScreen({super.key});

  @override
  State<LoginOnboardingScreen> createState() => _LoginOnboardingScreenState();
}

class _LoginOnboardingScreenState extends State<LoginOnboardingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LoginPage(),
    LoginPage(),
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

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final int length = 6;
  late List<TextEditingController> ctrls;
  late List<FocusNode> fns;
  String _name = 'USER';
  static const Color kBackground = Colors.white;
  static const Color kAccent = Color(0xFFD1C09A);
  static const Color kField = Color(0xFFF1F1F1);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ctrls = List.generate(length, (_) => TextEditingController());
    fns = List.generate(length, (_) => FocusNode());

    // Focus first field after a short delay
    Timer(const Duration(milliseconds: 250), () => fns[0].requestFocus());

    // Trigger initial validation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loginformKey.currentState?.validate();
      setState(() {}); // update login button
    });

    // Rebuild on text change for reactive button state
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is String && arg.isNotEmpty) _name = arg.toUpperCase();
  }

  @override
  void dispose() {
    ctrls.forEach((c) => c.dispose());
    fns.forEach((f) => f.dispose());
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get _isComplete {
    final formState = _loginformKey.currentState;
    if (formState == null) return false;
    return formState.validate() &&
        emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _loginformKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: kAccent,
                    child: Icon(Icons.person, size: 44),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'User Account',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  buildTextFormField(
                    "Email",
                    emailController,
                    validator: (val) {
                      if (emailController.text.length>0 && val!.isEmpty) return "Enter email";
                      final emailRegex =
                      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                      if (emailController.text.length>0 &&!emailRegex.hasMatch(val!)) return "Invalid email";
                      return null;
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: showPassword,
                    builder: (context, visible, _) {
                      return buildPasswordFormField(
                        "Password",
                        passwordController,
                        visible,
                        validator: (val) =>
                        passwordController.text.length>0 && val!.length < 6 ? "Min 6 chars" : null,
                        onToggle: () => showPassword.value = !visible,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: _isComplete
                        ? () {
                      if (_loginformKey.currentState!.validate()) {
                        Map<String, dynamic> params =
                        {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };

                        context.read<LoginBloc>().add(OnLoginEvent(params: params));
                      }
                    }
                        : null,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: _isComplete ? kAccent : kField,
                      child: Icon(
                        Icons.check,
                        size: 28,
                        color: _isComplete ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String hint, TextEditingController controller,
      {String? Function(String?)? validator}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget buildPasswordFormField(
      String hint, TextEditingController controller, bool isVisible,
      {String? Function(String?)? validator, required VoidCallback onToggle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: !isVisible,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}
