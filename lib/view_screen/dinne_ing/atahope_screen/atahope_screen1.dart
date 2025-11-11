import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtahopeScreen1 extends StatefulWidget {
  const AtahopeScreen1({super.key});

  @override
  State<AtahopeScreen1> createState() => _AtahopeScreen1State();
}

class _AtahopeScreen1State extends State<AtahopeScreen1> {
  int selectedTab = 0;
  String selectedLanguage = "EN";
  String selectedCountry = "AE";


  final List<String> globeImages = [
    "assets/images/glob_full.png", // Globe
    "assets/images/glob_full.png", // Map
    "assets/images/glob_full.png", // Satellite
    "assets/images/glob_full.png",
    "assets/images/glob_full.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: AppBar(
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            //automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0), // optional to give some spacing
                child: Image.asset(
                  "assets/images/splash.png",
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            title: Text(
              'ATAHOPE',
                style: GoogleFonts.libreFranklin(
                  textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 25,
                    fontWeight: FontWeight.w400,),
                )
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
                icon: Image.asset(
                  "assets/images/cart_icon.png",
                  width: 22,
                  height: 22,
                ),
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
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // ===== FOOD CARDS =====
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FoodCard(
                      image:
                      "assets/images/double_chicken.png",
                      title: "Double chicken",
                      price: "15 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/pizza_mozzarella.png",
                      title: "Pizza Mozzarella",
                      price: "20 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/spaghetti_special.png",
                      title: "Spaghetti Special",
                      price: "25 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/double_chicken.png",
                      title: "Double chicken",
                      price: "15 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/pizza_mozzarella.png",
                      title: "Pizza Mozzarella",
                      price: "20 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/spaghetti_special.png",
                      title: "Spaghetti Special",
                      price: "25 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/double_chicken.png",
                      title: "Double chicken",
                      price: "15 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/pizza_mozzarella.png",
                      title: "Pizza Mozzarella",
                      price: "20 AED",
                    ),
                    FoodCard(
                      image:
                      "assets/images/spaghetti_special.png",
                      title: "Spaghetti Special",
                      price: "25 AED",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ===== LANGUAGE & CURRENCY DROPDOWNS =====
              // ===== LANGUAGE & CURRENCY DROPDOWNS =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Language dropdown
                  Container(
                    width: 100,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedLanguage,
                        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.black87),
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 20,
                            fontWeight: FontWeight.w400,),
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        items: ["EN", "FR", "ES"]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value!;
                          });
                        },
                      ),
                    ),
                  ),

                  // Country dropdown
                  Container(
                    width: 100,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedCountry,
                        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.black87),
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 20,
                            fontWeight: FontWeight.w400,),
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        items: ["AE", "IN", "US"]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountry = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),



              const SizedBox(height: 40),

              // ===== SEARCH BAR =====
              Container(
                height: 45,
                width: 285,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    // 🔹 Text Field
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppColors.black87),
                          ),
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 21,
                              fontWeight: FontWeight.w400,),
                          ),
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),

                    // 🔹 Right-side circle with icons
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(AppRoutes.atahopeScreen2);
                      },
                      child: Container(
                        height: 45,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: AppColors.purple, // purple background
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/search.png",
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 6),
                            Image.asset(
                              "assets/images/microphone.png",
                              width: 24,
                              height: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ===== FROM - TO TEXTFIELDS + DISTANCE =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gray),
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.gray
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'From',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: AppColors.black87),
                        ),
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 20,
                            fontWeight: FontWeight.w400,),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "Distance",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 14,
                            fontWeight: FontWeight.w400,),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Image.asset(
                        "assets/images/distance.png",
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gray),
                        borderRadius: BorderRadius.circular(50),
                          color: AppColors.gray
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'To',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: AppColors.black87),
                        ),
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 20,
                            fontWeight: FontWeight.w400,),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ===== GLOBE SECTION (TABS FIXED ON RIGHT) =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray),
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.gray
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/zoom_out_icon.png",
                            ),
                            SizedBox(height: 25,),
                            Image.asset(
                              "assets/images/zoom_in_icon.png",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Left: Animated globe section
                  Expanded(
                    child: SizedBox(
                      height: 400,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (child, anim) => FadeTransition(
                                opacity: anim,
                                child: child,
                              ),
                              child: ClipRRect(
                                key: ValueKey<int>(selectedTab),
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  globeImages[selectedTab],
                                  height: 240,
                                  width: 240,
                                  fit: BoxFit.cover,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //const SizedBox(width: 20),

                  // Right: Fixed vertical tabs
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTabButton(
                        index: 0,
                        assetPath: "assets/images/globe1.png",
                        activeColor: AppColors.purple,
                        height: 30,
                        width: 30
                      ),
                      const SizedBox(height: 12),
                      buildTabButton(
                        index: 1,
                        assetPath: "assets/images/spoon.png",
                        activeColor: AppColors.purple,
                        height: 30,
                        width: 30
                      ),
                      const SizedBox(height: 12),
                      buildTabButton(
                        index: 2,
                        assetPath: "assets/images/direction.png",
                        activeColor: AppColors.purple,
                        height: 30,
                        width: 30
                      ),
                      const SizedBox(height: 12),
                      buildTabButton(
                          index: 2,
                          assetPath: "assets/images/c_tab.png",
                          activeColor: AppColors.purple,
                          height: 30,
                          width: 30
                      ),
                      const SizedBox(height: 12),
                      buildTabButton(
                          index: 2,
                          assetPath: "assets/images/upgrade_icon.png",
                          activeColor: AppColors.purple,
                          height: 30,
                          width: 30
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabButton({
    required int index,
    required String assetPath,   // <-- changed
    required Color activeColor,
    double width = 20,           // <-- optional dynamic size
    double height = 20,
  }) {
    final bool isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? activeColor : Colors.transparent,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: activeColor.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            assetPath,
            fit: BoxFit.contain,
            color: isSelected ? AppColors.white : AppColors.black54, // tint color
          ),
        ),
      ),
    );
  }

}

// ===== FOOD CARD WIDGET =====
class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Image.asset(
            image,
          ),
          //Image.network(image, height: 60, fit: BoxFit.contain),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                fontWeight: FontWeight.w400,),
            ),
          ),
          Text(
            price,
            style: GoogleFonts.secularOne(
              textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.red,fontSize: 15,
                fontWeight: FontWeight.w400,),
            ),
          ),
        ],
      ),
    );
  }
}
