import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/atahope_screen3.dart'
    show s2;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtahopeScreen2 extends StatefulWidget {
  const AtahopeScreen2({super.key});

  @override
  State<AtahopeScreen2> createState() => _AtahopeScreen2State();
}

class _AtahopeScreen2State extends State<AtahopeScreen2> {
  int selectedTab = 0;
  final ValueNotifier<int> selectedRestaurantTab = ValueNotifier(0);
  final ValueNotifier<int> selectedCafetariaTab = ValueNotifier(0);
  String selectedLanguage = "EN";
  String selectedCountry = "AE";
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();


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
                  Navigator.of(context).pushNamed(AppRoutes.atahopeScreen3);
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[200], // circular background
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(6),
                  minimumSize: const Size(24, 24),
                ),
                icon: Icon(Icons.add, size: 24, color: Colors.black),
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // ===== SEARCH BAR =====
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16.0),
                child: Container(
                  height: 45,
                  width: 285,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      // 🔹 Text Field
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Double chicken',
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

                        },
                        child: Container(
                          height: 45,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: AppColors.purple, // purple background
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ===== FROM - TO TEXTFIELDS + DISTANCE =====
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: fromController,
                          builder: (context, value, _) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: fromController.text.isNotEmpty
                                    ? AppColors.purple
                                    : AppColors.gray,),
                                borderRadius: BorderRadius.circular(50),
                                color:  fromController.text.isNotEmpty
                                    ? AppColors.purple
                                    : AppColors.gray,
                            ),
                            child: TextField(
                              controller: fromController,
                              textAlign: TextAlign.left,
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
                          );
                        }
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/distance.png",
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: toController,
                          builder: (context, value, _) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: toController.text.isNotEmpty
                                    ? AppColors.purple
                                    : AppColors.gray,),
                                borderRadius: BorderRadius.circular(50),
                                color:  toController.text.isNotEmpty
                                    ? AppColors.purple
                                    : AppColors.gray,
                            ),
                            child: TextField(
                              controller: toController,
                              textAlign: TextAlign.left,
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
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
              SizedBox(
                height: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:16.0, right: 16.0),
                          child: buildRestaurantTabButton(
                            index: 0,
                            assetPath: "assets/images/restaurant.png",
                            activeColor: AppColors.purple,
                            title: "96 Restaurants"
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder<int>(
                            valueListenable: selectedRestaurantTab,
                            builder: (context, value, _) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      transitionBuilder: (child, anim) => FadeTransition(
                                        opacity: anim,
                                        child: child,
                                      ),
                                      child: RestaurantScroll()
                                    ),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 390,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:16.0, right: 16.0),
                      child: buildRestaurantTabButton(
                          index: 0,
                          assetPath: "assets/images/cafetaria.png",
                          activeColor: AppColors.purple,
                          title: "105 Cafeteria’s"
                      ),
                    ),
                    Expanded(
                      child: ValueListenableBuilder<int>(
                        valueListenable: selectedCafetariaTab,
                        builder: (context, value, _) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width-50,
                                  child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      transitionBuilder: (child, anim) => FadeTransition(
                                        opacity: anim,
                                        child: child,
                                      ),
                                      child: CafetariaScroll()
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:8.0,top:20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      buildTabButton(
                                          index: 0,
                                          assetPath: "assets/images/globe1.png",
                                          activeColor: AppColors.purple,
                                          height: 15,
                                          width: 15
                                      ),
                                      const SizedBox(height: 8),
                                      buildTabButton(
                                          index: 1,
                                          assetPath: "assets/images/spoon.png",
                                          activeColor: AppColors.purple,
                                          height: 15,
                                          width: 15
                                      ),
                                      const SizedBox(height: 8),
                                      buildTabButton(
                                          index: 2,
                                          assetPath: "assets/images/direction.png",
                                          activeColor: AppColors.purple,
                                          height: 15,
                                          width: 15
                                      ),
                                      const SizedBox(height: 8),
                                      buildTabButton(
                                          index: 3,
                                          assetPath: "assets/images/c_tab.png",
                                          activeColor: AppColors.purple,
                                          height: 15,
                                          width: 15
                                      ),
                                      const SizedBox(height: 8),
                                      buildTabButton(
                                          index: 4,
                                          assetPath: "assets/images/upgrade_icon.png",
                                          activeColor: AppColors.purple,
                                          height: 15,
                                          width: 15
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                        child: SizedBox(
                          height: 115,
                            width: 115,
                            child: Image.asset("assets/images/c3.png"))),
                  ],
                ),
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
  Widget buildRestaurantTabButton({
    required int index,
    required String assetPath,
    required Color activeColor,
    required String title,
  }) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedRestaurantTab,
      builder: (context, selectedIndex, _) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => selectedRestaurantTab.value = index,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // LEFT ICON
              SizedBox(
                height: 45,
                width: 45,
                child: Image.asset(
                  assetPath,
                ),
              ),

              const SizedBox(width: 8),

              // RIGHT CHIP
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? activeColor : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  title,
                    style: GoogleFonts.secularOne(
                      textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 20,
                        fontWeight: FontWeight.w600,),
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }



}


// ===== MODEL =====
class Restaurant {
  final String title;
  final String image;
  final String image1;
  final int distance;

  Restaurant({required this.title, required this.image, required this.distance, required this.image1});
}

// ===== SAMPLE DATA =====
final List<Restaurant> restaurants = [
  Restaurant(title: "Cafe de Paris",image: "assets/images/cafe.png", image1: "assets/images/r1.png", distance: 15),
  Restaurant(title: "Black Burgers",image: "assets/images/black_burger.png", image1: "assets/images/r2.png", distance: 20),
  Restaurant(title: "Organic Food",image: "assets/images/organic_food.png", image1: "assets/images/r3.png", distance: 30),
  Restaurant(title: "Cafe de Paris",image: "assets/images/cafe.png", image1: "assets/images/r1.png", distance: 15),
  Restaurant(title: "Black Burgers",image: "assets/images/black_burger.png", image1: "assets/images/r2.png", distance: 20),
  Restaurant(title: "Organic Food",image: "assets/images/organic_food.png", image1: "assets/images/r3.png", distance: 30),
];

// ===== MAIN WIDGET =====
class RestaurantScroll extends StatefulWidget {
  const RestaurantScroll({super.key});

  @override
  State<RestaurantScroll> createState() => _RestaurantScrollState();
}

class _RestaurantScrollState extends State<RestaurantScroll> {
  late PageController controller;
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.43, initialPage: 1);
  }

  int mappedIndex(int i) {
    if (i == 0) return restaurants.length - 1;
    if (i == restaurants.length + 1) return 0;
    return i - 1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return Row(
            children: [
              /// LEFT ARROW
              IconButton(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/round_back.png")),
                onPressed: () {
                  currentIndex.value--;
                  controller.animateToPage(
                    currentIndex.value + 1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                  );
                },
              ),

              /// PAGE VIEW
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: restaurants.length + 2,
                  onPageChanged: (page) {
                    if (page == 0) {
                      Future.microtask(() => controller.jumpToPage(restaurants.length));
                      currentIndex.value = restaurants.length - 1;
                    } else if (page == restaurants.length + 1) {
                      Future.microtask(() => controller.jumpToPage(1));
                      currentIndex.value = 0;
                    } else {
                      currentIndex.value = page - 1;
                    }
                  },
                  itemBuilder: (context, i) {
                    final r = restaurants[mappedIndex(i)];
                    final double pad = (mappedIndex(i) == currentIndex.value) ? 20 : 0;

                    return Padding(
                      padding: EdgeInsets.only(top: pad),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// TITLE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(r.image),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  r.title,
                                  style: GoogleFonts.secularOne(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          /// IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 115,
                                width: 115,
                                child: Image.asset(r.image1, fit: BoxFit.cover)
                            ),
                          ),

                          /// bottom arrows + distance
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/f1.png"),
                              SizedBox(width: 2.0,),
                              Image.asset("assets/images/f2.png"),
                              SizedBox(width: 2.0,),
                              Text(
                                "${r.distance}m",
                                style: GoogleFonts.secularOne(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// RIGHT ARROW
              IconButton(
                icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/images/round_forward.png")),
                onPressed: () {
                  currentIndex.value++;
                  controller.animateToPage(
                    currentIndex.value + 1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// ===== MODEL =====
class Cafetaria {
  final String title;
  final String image;
  final String image1;
  final int distance;

  Cafetaria({required this.title, required this.image, required this.distance, required this.image1});
}
// ===== SAMPLE DATA =====
final List<Cafetaria> cafetaria = [
  Cafetaria(title: "Beirut Coffee",image: "assets/images/c4.png", image1: "assets/images/c1.png", distance: 15),
  Cafetaria(title: "Coffee Lounge",image: "assets/images/c5.png", image1: "assets/images/c2.png", distance: 20),
  Cafetaria(title: "Beirut Coffee",image: "assets/images/c4.png", image1: "assets/images/c1.png", distance: 15),
  Cafetaria(title: "Coffee Lounge",image: "assets/images/c5.png", image1: "assets/images/c2.png", distance: 20),
  Cafetaria(title: "Beirut Coffee",image: "assets/images/c4.png", image1: "assets/images/c1.png", distance: 15),
  Cafetaria(title: "Coffee Lounge",image: "assets/images/c5.png", image1: "assets/images/c2.png", distance: 20),
];

// ===== MAIN WIDGET =====
class CafetariaScroll extends StatefulWidget {
  const CafetariaScroll({super.key});

  @override
  State<CafetariaScroll> createState() => _CafetariaScrollState();
}
class _CafetariaScrollState extends State<CafetariaScroll> {
  late PageController controller;
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.6, initialPage: 1);
  }

  int mappedIndex(int i) {
    if (i == 0) return cafetaria.length - 1;
    if (i == cafetaria.length + 1) return 0;
    return i - 1;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return Row(
            children: [
              /// LEFT ARROW
              IconButton(
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/round_back.png")),
                onPressed: () {
                  currentIndex.value--;
                  controller.animateToPage(
                    currentIndex.value + 1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                  );
                },
              ),

              /// PAGE VIEW
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: cafetaria.length + 2,
                  onPageChanged: (page) {
                    if (page == 0) {
                      Future.microtask(() => controller.jumpToPage(cafetaria.length));
                      currentIndex.value = cafetaria.length - 1;
                    } else if (page == cafetaria.length + 1) {
                      Future.microtask(() => controller.jumpToPage(1));
                      currentIndex.value = 0;
                    } else {
                      currentIndex.value = page - 1;
                    }
                  },
                  itemBuilder: (context, i) {
                    final r = cafetaria[mappedIndex(i)];
                    final double pad = (mappedIndex(i) == currentIndex.value) ? 20 : 0;

                    return Padding(
                      padding: EdgeInsets.only(top: pad),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// TITLE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(r.image),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  r.title,
                                  style: GoogleFonts.secularOne(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          /// IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                height: 90,
                                width: 90,
                                child: Image.asset(r.image1, fit: BoxFit.cover)
                            ),
                          ),

                          /// bottom arrows + distance
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/f1.png"),
                              SizedBox(width: 2.0,),
                              Image.asset("assets/images/f2.png",width: 48,),
                              SizedBox(width: 2.0,),
                              Text(
                                "${r.distance}m",
                                style: GoogleFonts.secularOne(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// RIGHT ARROW
              IconButton(
                icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/round_forward.png")),
                onPressed: () {
                  currentIndex.value++;
                  controller.animateToPage(
                    currentIndex.value + 1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

/*class _CafetariaScrollState extends State<CafetariaScroll> {
  late PageController controller;
  ValueNotifier<int> currentIndex = ValueNotifier(0);


  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.6, initialPage: 1);
  }

  int mappedIndex(int i) {
    if (i == 0) return restaurants.length - 1;
    if (i == restaurants.length + 1) return 0;
    return i - 1;
  }

  @override
  Widget build(BuildContext context) {
    return horizontalList();

  }

  Widget horizontalList() {
    final ScrollController _controller = ScrollController();
    double itemExtent = 120 + 12; // item width + spacing
    int currentIndex = 0;

    // Scroll to a specific index
    void scrollToIndex(int index) {
      _controller.animateTo(
        index * itemExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }

    // Listen to manual scroll to update index
    _controller.addListener(() {
      currentIndex = (_controller.offset / itemExtent).round();
    });
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          IconButton(
            icon: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/images/round_back.png")),
            onPressed: () {
              if (currentIndex > 0) {
                currentIndex--;
                scrollToIndex(currentIndex);
              }
            },
          ),
          Expanded(
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemCount: cafetaria.length,
              itemBuilder: (context, index) {
                final r = cafetaria[mappedIndex(index)];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// TITLE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(r.image),
                        const SizedBox(width: 4),
                        Text(
                          r.title,
                          style: GoogleFonts.secularOne(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height:115,
                          width:115,
                          child: Image.asset(r.image1, fit: BoxFit.cover)),
                    ),

                    /// bottom arrows + distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/f1.png"),
                        Image.asset("assets/images/f2.png"),
                        Text(
                          "${r.distance}m",
                          style: GoogleFonts.secularOne(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          IconButton(
            icon: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/images/round_forward.png")),
            onPressed: () {
              if (currentIndex < cafetaria.length - 1) {
                currentIndex++;
                scrollToIndex(currentIndex);
              }
            },
          ),
        ],
      ),
    );
  }
}*/

