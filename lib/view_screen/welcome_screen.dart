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
    WebBackHelper().disableBackButton();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        debugPrint("Back button disabled");
      },
      child: Scaffold(
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
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(color: AppColors.textBlack, letterSpacing: .5,fontSize: 18,
                          fontWeight: FontWeight.w200,),
                      ),
                    ),
                    const SizedBox(height: 120),

                    // Dine-in option
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/dinne_img.svg',
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            //NavigationHelper.push(AppRoutes.dineIn);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.gray,
                            foregroundColor: AppColors.textBlack,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                          ),
                          child: Text(
                            "Dinne-ing",
                            style: GoogleFonts.secularOne(
                              textStyle: const TextStyle(letterSpacing: .5, color:AppColors.textBlack,fontSize: 14,
                                fontWeight: FontWeight.w200,),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Delivery option
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/delivery_img.svg',
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            NavigationHelper.push(AppRoutes.dineIn);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.gray,
                            foregroundColor: AppColors.textBlack,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                          ),
                          child: Text(
                            "Delivery",
                            style: GoogleFonts.secularOne(
                              textStyle: const TextStyle(letterSpacing: .5,color:AppColors.textBlack,fontSize: 14,
                                fontWeight: FontWeight.w200,),
                            ),
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
      ),
    );
  }
}
