import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class AtahopeScreen3 extends StatefulWidget {
  const AtahopeScreen3({super.key});

  @override
  State<AtahopeScreen3> createState() => _AtahopeScreen3State();
}

class _AtahopeScreen3State extends State<AtahopeScreen3> {
  late PageController _pageController;
  int currentIndex = 0;
  int selectedTab = 0;
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  List<Map<String, dynamic>> items = [
    {
      "title": "Cafe de Paris",
      "image": "assets/images/r1.png",
      "time": "15 m",
      "place": "Marina Canal View Center",
      "desc":
      "A contemporary take on recreating the authentic Parisian cafe experience, complete with an ambiance that precisely matches the aesthetics of French culture, we at Café de Paris meticulously work to bring you the core essence of France. Our skilled artisans perfect every indulging entree, dessert, and drink to strike the sweet balance between classic french dining and modernism.",
    },
    {
      "title": "Another Cafe",
      "image": "assets/images/r1.png",
      "time": "10 m",
      "place": "Downtown Center",
      "desc": "A contemporary take on recreating the authentic Parisian cafe experience, complete with an ambiance that precisely matches the aesthetics of French culture, we at Café de Paris meticulously work to bring you the core essence of France. Our skilled artisans perfect every indulging entree, dessert, and drink to strike the sweet balance between classic french dining and modernism.",
    },
    // add more items...
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doubleChicken = [
      {"title": "Double Chicken", "image": "assets/images/dc1.png", "st1": "RICE: 60%","st2":"FISH: 25%"},
      {"title": "Sushi Bronze", "image": "assets/images/dc2.png", "st1": "Soy sauce: 60%","st2":"GINGER: 25%"},
      {"title": "Sushi Royal", "image": "assets/images/dc3.png", "st1": "Wasabi: 60%", "st2":"Salads: 25%"},
      {"title": "Sushi Silver", "image": "assets/images/dc4.png", "st1": "Sea Food: 60%", "st2":"FISH: 25%"},
      {"title": "Double Chicken", "image": "assets/images/dc1.png", "st1": "RICE: 60%","st2":"FISH: 25%"},
      {"title": "Sushi Bronze", "image": "assets/images/dc2.png", "st1": "Soy sauce: 60%","st2":"GINGER: 25%"},
      {"title": "Sushi Royal", "image": "assets/images/dc3.png", "st1": "Wasabi: 60%", "st2":"Salads: 25%"},
      {"title": "Sushi Silver", "image": "assets/images/dc4.png", "st1": "Sea Food: 60%", "st2":"FISH: 25%"},
    ];

    final List<Map<String, String>> bestSellers = [
      {"title": "Gastroenvy Gold", "image": "assets/images/bs1.png", "st1": "Vegetables: 30%","st2":"Proteins: 15%"},
      {"title": "Gastroenvy Silver", "image": "assets/images/bs2.png", "st1": "Carbohydrates: 45%","st2":"Fruits: 5-10 %"},
      {"title": "Gastroenvy Royal", "image": "assets/images/bs3.png", "st1": "Herbs: 15%","st2":"Spices:: 25-30 %"},
      {"title": "Gastroenvy Gold", "image": "assets/images/bs1.png", "st1": "Vegetables: 30%","st2":"Proteins: 15%"},
      {"title": "Gastroenvy Silver", "image": "assets/images/bs2.png", "st1": "Carbohydrates: 45%","st2":"Fruits: 5-10 %"},
      {"title": "Gastroenvy Royal", "image": "assets/images/bs3.png", "st1": "Herbs: 15%","st2":"Spices:: 25-30 %"}
    ];

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
                  Navigator.of(context).pushNamed(AppRoutes.s4);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // ===== SEARCH BAR =====
              Padding(
                padding: const EdgeInsets.only(left:16.0, right: 16.0),
                child: Center(
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
              height: 250,
              child: Row(
                children: [
                  // BACK BUTTON
                  IconButton(
                    icon: SizedBox(
                        height: 26,
                        width: 26,
                        child: Image.asset("assets/images/round_back.png")),
                    onPressed: () {
                      if (currentIndex > 0) {
                        currentIndex--;
                        _pageController.animateToPage(
                          currentIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  ),

                  // PAGEVIEW CONTENT
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: items.length,
                      physics: NeverScrollableScrollPhysics(), // disable swipe, only buttons
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return buildYourContent(item); // YOUR ROW CONTENT
                      },
                    ),
                  ),

                  // FORWARD BUTTON
                  IconButton(
                    icon: SizedBox(
                      height: 26,
                        width: 26,
                        child: Image.asset("assets/images/round_forward.png")),
                    onPressed: () {
                      if (currentIndex < items.length - 1) {
                        currentIndex++;
                        _pageController.animateToPage(
                          currentIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),


              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // Section 1: Double Chicken
                        _buildSectionTitle("Double Chicken", Colors.purple),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left:16.0,),
                          child: HorizontalListWidget(items:doubleChicken,imageWidth: 80),
                        ),
                        const SizedBox(height: 10),

                        // Section 2: Best Sellers
                        _buildSectionTitle("Best sellers", Colors.purpleAccent),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left:16.0,),
                          child: HorizontalListWidget(items: bestSellers, imageWidth: 110),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
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


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: AppColors.textBlack,
              fontSize:15,
              fontWeight: FontWeight.w400,
            ),
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

  Widget buildYourContent(Map<String, dynamic> item) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/cafe.png"),
                  SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      item["title"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            SizedBox(
              height: 125,
                width: 125,
                child: Image.asset(item["image"])),

            SizedBox(
              width: 125,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                        width: 15,
                        child: Image.asset("assets/images/wait.png")),
                    SizedBox(width: 5),
                    SizedBox(child: Image.asset("assets/images/f2.png")),
                    SizedBox(width: 5),
                    Text(
                      item["time"],
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

        SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height:29,
                      width: 29,
                      child: Image.asset("assets/images/restaurant.png")),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      item["place"],
                      style: GoogleFonts.secularOne(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                item["desc"],
                maxLines: 50,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.secularOne(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class HorizontalListWidget extends StatefulWidget {
  final List<Map<String, String>> items;
  final double imageWidth;

  const HorizontalListWidget({
    super.key,
    required this.items,
    this.imageWidth = 80,
  });

  @override
  State<HorizontalListWidget> createState() => _HorizontalListWidgetState();
}

class _HorizontalListWidgetState extends State<HorizontalListWidget> {
  final ScrollController _controller = ScrollController();
  int currentIndex = 0;

  double itemExtent = 132; // 120 + 12

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentIndex = (_controller.offset / itemExtent).round();
      });
    });
  }

  void scrollToIndex(int index) {
    _controller.animateTo(
      index * itemExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;

    return SizedBox(
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  width: widget.imageWidth,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(item["image"]!),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["title"]!, style: TextStyle(fontSize: 10)),
                            Text(item["st1"]!, style: TextStyle(fontSize: 9)),
                            Text(item["st2"]!, style: TextStyle(fontSize: 9)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// Forward Button
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: IconButton(
              icon: Image.asset("assets/images/round_forward.png", height: 25),
              onPressed: () {
                if (currentIndex < items.length - 1) {
                  scrollToIndex(currentIndex + 1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

