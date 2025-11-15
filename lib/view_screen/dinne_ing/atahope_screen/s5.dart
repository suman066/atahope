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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0), // optional to give some spacing
            child: Image.asset(
              "assets/images/back.png",      // <-- your asset path
              width: 22,
              height: 22,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image (logo or icon)
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomSwitch(
              value: false,
              onChanged: (val) {
                debugPrint('Dark mode: $val');
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
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
              // Burger with tags around it
              Center(
                child: SizedBox(
                  width: 330,
                  height: 290,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Center Burger Image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/burger.png'), // your image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Bun - Top
                      Positioned(
                        top: 50,
                        left: 20,
                        child: _buildLabel('Bun'),
                      ),

                      // Tomatoes - Top Right
                      Positioned(
                        top: 50,
                        right: 0,
                        child: _buildLabel('Tomatoes'),
                      ),

                      // Sauce - Right Center
                      Positioned(
                        right: 0,
                        bottom: 120,
                        child: _buildLabel('Sauce'),
                      ),

                      // Salad - Bottom Right
                      Positioned(
                        bottom:30,
                        right: 30,
                        child: _buildLabel('Salad'),
                      ),

                      // Steak - Bottom Left (angled)
                      /*Positioned(
                        bottom: 10,
                        left: 40,
                        child: Transform.rotate(
                          angle: -0.3,
                          child: _buildLabel('Steak'),
                        ),
                      ),*/
                      Positioned(
                        bottom: 30,
                        left: 30,
                        child: _buildLabel('Steak'),
                      ),

                      // Cheese - Left Center
                      Positioned(
                        left: 0,
                        bottom: 120,
                        child: _buildLabel('Cheese'),
                      ),
                    ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors.textBlack,
            fontSize: 20,
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
            padding: const EdgeInsets.only(bottom: 28.0),
            child: IconButton(
              icon: Image.asset("assets/images/round_back.png"),
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
              icon: Image.asset("assets/images/round_forward.png"),
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

}
