import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/helper/platform_helper/back_helper/platform_web_back_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    //WebBackHelper().disableBackButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Welcome to Atahope",
                    style: GoogleFonts.libreFranklin(
                      textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 35,
                        fontWeight: FontWeight.w400,),
                    ),
                  ),
                  const SizedBox(height: 120),

                  // Dine-in option
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/dinne-ing.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          NavigationHelper.push(AppRoutes.dineIn);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray,
                          foregroundColor: AppColors.textBlack,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 4),
                        ),
                        child: Text(
                          "Dinne-ing",
                          style: GoogleFonts.libreFranklin(
                            textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 35,
                              fontWeight: FontWeight.w400,),
                          )
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 70),

                  // Delivery option
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/delivery.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          //NavigationHelper.push(AppRoutes.dineIn);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray,
                          foregroundColor: AppColors.textBlack,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 4),
                        ),
                        child: Text(
                          "Delivery",
                          style: GoogleFonts.libreFranklin(
                            textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 35,
                              fontWeight: FontWeight.w400,),
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
