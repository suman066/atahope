import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class s5 extends StatefulWidget {
  const s5({super.key});

  @override
  State<s5> createState() => _s5State();
}

class _s5State extends State<s5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,

          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top row (back + switch)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          "assets/images/back.png",
                          width: 22,
                          height: 22,
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 4),

                          // Title block
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
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

                          const SizedBox(height: 4),

                          Text(
                            "Cafe de Paris",
                            style: GoogleFonts.secularOne(
                              textStyle: const TextStyle(
                                color: AppColors.textBlack,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                      CustomSwitch(
                        value: false,
                        onChanged: (val) {},
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              // Title
              Text(
                "Burger Bites",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 380, // total width of your design
                    height: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Center Burger Image
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/burger.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Bun - Top
                        Positioned(
                          top: 10,
                          left: 35,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right: 5.0),
                                    child: _buildLabel('Bun'),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                ],
                              ),
                              const SizedBox(width: 2),
                              Padding(
                                padding: const EdgeInsets.only(top:25.0),
                                child: _buildArrow(direction: AxisDirection.right,  image:"assets/images/arrow_01.png"),
                              ),
                            ],
                          ),
                        ),

                        // Tomatoes - Top Right
                        Positioned(
                          top: 10,
                          right: 0,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:35.0),
                                child: _buildArrow(direction: AxisDirection.left, image:"assets/images/arrow_06.png"),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:15.0, top: 7.0),
                                    child: _buildLabel('Tomatoes'),
                                  ),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Sauce - Right Center
                        Positioned(
                          right: 20,
                          top: 90,
                          child: Row(
                            children: [
                              _buildArrow(direction: AxisDirection.left, image:"assets/images/arrow_05.png"),
                              const SizedBox(width: 2),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right: 5.0),
                                    child: _buildLabel('Sauce'),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Salad - Bottom Right
                        Positioned(
                          bottom: 10,
                          right: 30,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:30.0),
                                child: _buildArrow(direction: AxisDirection.left, image:"assets/images/arrow_04.png"),
                              ),
                              const SizedBox(width: 2),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right: 5.0),
                                    child: _buildLabel('Salad'),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Steak - Bottom Left
                        Positioned(
                          bottom: 10,
                          left: 30,
                          child: Transform.rotate(
                            angle: -0.2,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:10.0,right: 5.0),
                                      child: _buildLabel('Steak'),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                  ],
                                ),
                                const SizedBox(width: 2),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10.0),
                                  child: _buildArrow(direction: AxisDirection.right, image:"assets/images/arrow_03.png"),
                                ),

                              ],
                            ),
                          ),
                        ),

                        // Cheese - Left Center
                        Positioned(
                          left: 0,
                          top: 90,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0,right: 5.0),
                                    child: _buildLabel('Cheese'),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset('assets/images/plus.png', height: 15,width: 15,))
                                ],
                              ),
                              const SizedBox(width: 5),
                              Transform.rotate(
                                  angle: -0.3,
                                  child: _buildArrow(direction: AxisDirection.right, image:"assets/images/arrow_02.png")),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 30),

              // Extra Sauce Section
              _buildSectionHeader("Extra Sauce", count: 1),
              const SizedBox(height: 10),
              _buildHorizontalList([
                {'image': 'assets/images/bb1.png', 'text': 'peperonni'},
                {'image': 'assets/images/bb2.png', 'text': 'Caviar'},
                {'image': 'assets/images/bb3.png', 'text': ' tomato'},
                {'image': 'assets/images/bb4.png', 'text': 'Mayosa'},
                {'image': 'assets/images/bb5.png', 'text': 'yassa'},
                {'image': 'assets/images/bb1.png', 'text': 'peperonni'},
                {'image': 'assets/images/bb2.png', 'text': 'Caviar'},
                {'image': 'assets/images/bb3.png', 'text': ' tomato'},
                {'image': 'assets/images/bb4.png', 'text': 'Mayosa'},
                {'image': 'assets/images/bb5.png', 'text': 'yassa'},
              ],
              height:79.0,width:50.0,gap: 12.0),

              const SizedBox(height: 10),

              // Suggestion Section
              _buildSectionHeader("Suggestion", count: 2),
              const SizedBox(height: 10),
              _buildHorizontalList([
                {'image': 'assets/images/bb6.png', 'text': ''},
                {'image': 'assets/images/bb7.png', 'text': ''},
                {'image': 'assets/images/bb8.png', 'text': ''},
                {'image': 'assets/images/bb9.png', 'text': ''},
                {'image': 'assets/images/bb6.png', 'text': ''},
                {'image': 'assets/images/bb7.png', 'text': ''},
                {'image': 'assets/images/bb8.png', 'text': ''},
                {'image': 'assets/images/bb9.png', 'text': ''},
              ],
              height: 110, width: 53, gap:30),

              const SizedBox(height: 25),

              // Desserts
              _buildHorizontalList([
                {'image': 'assets/images/bb10.png', 'text': ''},
                {'image': 'assets/images/bb11.png', 'text': ''},
                {'image': 'assets/images/bb12.png', 'text': ''},
                {'image': 'assets/images/bb13.png', 'text': ''},
                {'image': 'assets/images/bb10.png', 'text': ''},
                {'image': 'assets/images/bb11.png', 'text': ''},
                {'image': 'assets/images/bb12.png', 'text': ''},
                {'image': 'assets/images/bb13.png', 'text': ''},
              ], height: 103, width: 75,gap: 12.0),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Tag widget
  Widget _buildLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors.textBlack,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  // Section title with badge
  Widget _buildSectionHeader(String title, {int count = 0}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: AppColors.textBlack,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        if (count > 0)
          Positioned(
            right: -8,
            top: -8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }


  Widget _buildHorizontalList(
      List<Map<String, String>> items,
      {double height = 51, double width = 50, double gap = 12}
      ) {
    final ScrollController _controller = ScrollController();
    double itemExtent = width + 12; // item width + spacing
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
      height: height+12,
      child: Row(
        children: [
          /// BACK BUTTON
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: IconButton(
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
          ),

          /// HORIZONTAL LIST
          Expanded(
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(width: gap),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Image.asset(
                            item['image']!,
                            width: width,
                            height: height > 28 ? height - 28 : height,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index == 0 || index==4)
                          Positioned(
                            right: -8,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AppColors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '1',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        item['text']!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),

          /// FORWARD BUTTON
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: IconButton(
              icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/round_forward.png")),
              onPressed: () {
                if (currentIndex < items.length - 1) {
                  currentIndex++;
                  scrollToIndex(currentIndex);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBurgerIngredients() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 400,
          height: 350,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // BURGER IMAGE
              Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/burger.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // BUN (Top Left)
              Positioned(
                top: 40,
                left: 40,
                child: Row(
                  children: [
                    _buildIngredient("Bun"),
                    const SizedBox(width: 5),
                    _buildArrow(direction: AxisDirection.down, image:"assets/images/arrow_01.png"),
                  ],
                ),
              ),

              // SAUCE (Right)
              Positioned(
                right: 20,
                top: 120,
                child: Row(
                  children: [
                    _buildArrow(direction: AxisDirection.left, image:"assets/images/arrow_01.png"),
                    const SizedBox(width: 5),
                    _buildIngredient("Sauce"),
                  ],
                ),
              ),

              // TOMATOES (Top Right)
              Positioned(
                top: 40,
                right: 40,
                child: Row(
                  children: [
                    _buildArrow(direction: AxisDirection.down, image:"assets/images/arrow_01.png"),
                    const SizedBox(width: 5),
                    _buildIngredient("Tomatoes"),
                  ],
                ),
              ),

              // CHEESE (Left)
              Positioned(
                left: 20,
                top: 120,
                child: Row(
                  children: [
                    _buildIngredient("Cheese"),
                    const SizedBox(width: 5),
                    _buildArrow(direction: AxisDirection.right, image:"assets/images/arrow_01.png"),
                  ],
                ),
              ),

              // SALAD (Bottom Right)
              Positioned(
                bottom: 40,
                right: 40,
                child: Row(
                  children: [
                    _buildArrow(direction: AxisDirection.up, image:"assets/images/arrow_01.png"),
                    const SizedBox(width: 5),
                    _buildIngredient("Salad"),
                  ],
                ),
              ),

              // STEAK (Bottom Left)
              Positioned(
                bottom: 40,
                left: 40,
                child: Row(
                  children: [
                    _buildIngredient("Steak"),
                    const SizedBox(width: 5),
                    _buildArrow(direction: AxisDirection.up, image:"assets/images/arrow_01.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildIngredient(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 14, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildArrow({required AxisDirection direction, required String image}) {
    double angle = 0;

    switch (direction) {
      case AxisDirection.up:
        angle = -3.14 / 2;
        break;
      case AxisDirection.down:
        angle = 3.14 / 2;
        break;
      case AxisDirection.left:
        angle = 3.14;
        break;
      case AxisDirection.right:
        angle = 0;
        break;
    }

    return Image.asset(image);
  }


}
