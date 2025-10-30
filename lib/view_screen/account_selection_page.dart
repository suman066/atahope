import 'package:atahope/bloc/signup_bloc/signup_bloc.dart';
import 'package:atahope/bloc/signup_bloc/signup_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSelectionPage extends StatefulWidget {
  const AccountSelectionPage({super.key});

  @override
  State<AccountSelectionPage> createState() => _AccountSelectionPageState();
}

class _AccountSelectionPageState extends State<AccountSelectionPage> {
  bool switch1 = false;
  bool switch2 = false;


  // 🔹 Colors
  static const Color kAccent = Color(0xFFD1C09A);

  // 🔹 ValueNotifiers
  final ValueNotifier<bool> isDark = ValueNotifier(false);
  final ValueNotifier<bool> isEnglish = ValueNotifier(true);
  final ValueNotifier<String> accountType = ValueNotifier("user");

  final ValueNotifier<String?> gender = ValueNotifier(null);
  final ValueNotifier<String?> country = ValueNotifier(null);
  final ValueNotifier<String?> city = ValueNotifier(null);
  final ValueNotifier<String?> day = ValueNotifier(null);
  final ValueNotifier<String?> month = ValueNotifier(null);
  final ValueNotifier<String?> year = ValueNotifier(null);

  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  final ValueNotifier<bool> showConfirmPassword = ValueNotifier(false);

  // 🔹 Controllers
  final TextEditingController nickController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // 🔹 Lists
  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> countries = ["India", "USA", "UK"];
  final List<String> cities = ["Kolkata", "Delhi", "Mumbai"];
  final List<String> days = List.generate(31, (i) => "${i + 1}");
  final List<String> months = List.generate(12, (i) => "${i + 1}");
  final List<String> years = List.generate(50, (i) => "${1980 + i}");

  // 🔹 Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDark,
      builder: (context, dark, _) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 75, right: 70, bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text("Type of account")),

                // 🔹 Account Type
                ValueListenableBuilder(
                  valueListenable: accountType,
                  builder: (context, type, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => accountType.value = "user",
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: type == "user"
                                    ? Colors.brown.shade200
                                    : Colors.grey.shade200,
                                child: const Icon(Icons.person, size: 40),
                              ),
                              SizedBox(height: 5),
                              const Text("User Account"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => accountType.value = "pro",
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: type == "pro"
                                    ? Colors.brown.shade200
                                    : Colors.grey.shade200,
                                child: const Icon(Icons.star_border, size: 40),
                              ),
                              SizedBox(height: 5),
                              const Text("Professional Account"),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const Divider(thickness: 1),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildTextFormField("Nick name", nickController),
                          buildTextFormField("Name", nameController,
                              validator: (val) =>
                              val!.isEmpty ? "Enter your name" : null),
                          buildTextFormField("Email", emailController,
                              validator: (val) {
                                if (val!.isEmpty) return "Enter email";
                                final emailRegex =
                                RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                                if (!emailRegex.hasMatch(val)) return "Invalid email";
                                return null;
                              }),
                          buildTextFormField("Phone number", phoneController,
                              validator: (val) =>
                              val!.isEmpty ? "Enter phone number" : null),
                          buildTextFormField("Address", addressController),
                          buildTextFormField("Zip Code", zipController),
                          ValueListenableBuilder(
                            valueListenable: showPassword,
                            builder: (context, visible, _) {
                              return buildPasswordFormField(
                                  "Password", passwordController, visible,
                                  validator: (val) =>
                                  val!.length < 6 ? "Min 6 chars" : null,
                                  onToggle: () => showPassword.value = !visible);
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: showConfirmPassword,
                            builder: (context, visible, _) {
                              return buildPasswordFormField(
                                  "Confirm Password",
                                  confirmPasswordController,
                                  visible,
                                  validator: (val) => val != passwordController.text
                                      ? "Password mismatch"
                                      : null,
                                  onToggle: () =>
                                  showConfirmPassword.value = !visible);
                            },
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // All valid
                                  Map<String, dynamic> params =
                                    {
                                      "uName": nameController.text,
                                      "uNickName": nickController.text,
                                      "uGender": "M",
                                      "uDOB": "10-12-1980",
                                      "uEmail": emailController.text,
                                      "uMobile": phoneController.text,
                                      "countryId": "91",
                                      "cityId": "11",
                                      "uZip": zipController.text,
                                      "uAddress": addressController.text,
                                      "uPass": confirmPasswordController.text,
                                      "idustryTypeId": "",
                                      "cWebsite": "",
                                      "cPhoneNumber": "",
                                      "cLicence": "",
                                      "vatNumber": "",
                                      "appFullName": "",
                                      "userType": "U",
                                      "isActive": "A"
                                  };

                                  context.read<SignupBloc>().add(OnSignupEvent(params: params));
                                }
                              },
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: kAccent,
                                child: Icon(Icons.check, size: 28),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextFormField(String hint, TextEditingController controller,
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
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget buildPasswordFormField(String hint, TextEditingController controller,
      bool isVisible,
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
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}
