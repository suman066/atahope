import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class s4 extends StatefulWidget {
  const s4({super.key});

  @override
  State<s4> createState() => _s4State();
}

class _s4State extends State<s4> {
  int selectedCategory = 0;
  /*final List<String> categories = [
    'Appetizers',
    'Beverages',
    'Desserts',
    'Main course',
    'Side',
    'Special',
  ];*/
  final List<Map<String, dynamic>> categories = [
    {'name': 'Appetizers','image': 'assets/images/a1.png'},
    {'name': 'Beverages','image': 'assets/images/a2.png'},
    {'name': 'Desserts','image': 'assets/images/a7.png'},
    {'name': 'Main course','image': 'assets/images/a8.png'},
    {'name': 'Side','image': 'assets/images/a4.png'},
    {'name': 'Special','image': 'assets/images/a3.png'},
  ];

  final List<Map<String, dynamic>> meatItems = [
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m1.png'},
    {'name': 'Roma', 'price': '5 AED', 'time': '10m', 'image': 'assets/images/m2.png'},
    {'name': 'Silmont', 'price': '2.5 AED', 'time': '12m', 'image': 'assets/images/m3.png'},
    {'name': 'Buda', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m4.png'},
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m1.png'},
    {'name': 'Roma', 'price': '5 AED', 'time': '10m', 'image': 'assets/images/m2.png'},
    {'name': 'Silmont', 'price': '2.5 AED', 'time': '12m', 'image': 'assets/images/m3.png'},
    {'name': 'Buda', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m4.png'},
  ];
  final List<Map<String, dynamic>> meatlessItems = [
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m5.png'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'assets/images/m6.png'},
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m5.png'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'assets/images/m6.png'},
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m5.png'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'assets/images/m6.png'},
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'assets/images/m5.png'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'assets/images/m6.png'},
  ];
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
        child: SingleChildScrollView( // ✅ Makes entire screen scrollable
          //physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                child: _buildCategoryTabs(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildSectionTitle('Meatness',"assets/images/a9.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                child: FoodListWidget(items: meatItems),
              ),
              //const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildSectionTitle('Meatless',"assets/images/a5.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                child: FoodListWidget(items: meatlessItems),
              ),
             // const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Wrap(
        spacing: 4, // space between items horizontally
        runSpacing: 4, // space between lines
        alignment: WrapAlignment.start, // center all buttons
        children: List.generate(categories.length, (index) {
          final item = categories[index];
          final isSelected = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: AnimatedContainer(
              width: 118,
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(35),
                //border: Border.all(color: Colors.purple, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                      item["name"],
                    style:GoogleFonts.montserrat(
                      textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 17,
                        fontWeight: FontWeight.w400,),
                    )
                  ),
                  SizedBox(height: 2.0,),
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(item["image"])
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }


  Widget _buildSectionTitle(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          // Centered title
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                      style:GoogleFonts.montserrat(
                        textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 20,
                          fontWeight: FontWeight.w400,),
                      )
                  ),
                  SizedBox(width: 4.0,),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(image)
                  )
                ],
              ),
            ),
          ),

          // Right-side filter icon
          Positioned(
            right: 0,
            child: Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.s5);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    height: 25,
                      width: 25,
                      child: Image.asset("assets/images/filter.png", fit: BoxFit.cover,)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildFoodList(List<Map<String, dynamic>> items) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 170, // height for 2 cards
            width: MediaQuery.sizeOf(context).width-60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (items.length / 2).ceil(), // number of columns
              itemBuilder: (context, index) {
                int first = index * 2;
                int second = first + 1;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      // First item
                      SizedBox(
                        width: 160,
                        child: _buildFoodCard(items[first]),
                      ),
                      const SizedBox(height: 12),

                      // Second item (if available)
                      if (second < items.length)
                        SizedBox(
                          width: 160,
                          child: _buildFoodCard(items[second]),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        IconButton(
          icon: Image.asset("assets/images/round_forward.png", height: 25),
          onPressed: () {
           /* if (currentIndex < items.length - 1) {
              scrollToIndex(currentIndex + 1);
            }*/
          },
        ),
      ],
    );
  }


  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Image on the left
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:
            Image.asset(item['image'],
              height: 75,
              width: 70,
              fit: BoxFit.cover,),
          ),
          const SizedBox(width: 10),

          // Texts on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 15,
                      fontWeight: FontWeight.w400,),
                  )
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/images/money.png", fit: BoxFit.cover,)),
                    const SizedBox(width: 4),
                    Text(
                      item['price'],
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 10,
                          fontWeight: FontWeight.w400,),
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/images/a6.png", fit: BoxFit.cover,)),
                    const SizedBox(width: 4),
                    Text(
                      item['time'],
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 10,
                          fontWeight: FontWeight.w400,),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



}

class FoodListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const FoodListWidget({super.key, required this.items});

  @override
  State<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  final ScrollController _controller = ScrollController();
  int currentIndex = 0;

  // width of each column (must match your SizedBox width)
  final double columnWidth = 160 + 12; // 160 width + 12 padding

  void scrollToIndex(int index) {
    _controller.animateTo(
      index * columnWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();

    // Update currentIndex on manual scroll
    _controller.addListener(() {
      setState(() {
        currentIndex = (_controller.offset / columnWidth).round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    int columnCount = (items.length / 2).ceil();

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 170,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: columnCount,
              itemBuilder: (context, index) {
                int first = index * 2;
                int second = first + 1;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 160,
                        child: _buildFoodCard(items[first]),
                      ),
                      const SizedBox(height: 12),

                      if (second < items.length)
                        SizedBox(
                          width: 160,
                          child: _buildFoodCard(items[second]),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        // Forward Button
        IconButton(
          icon: Image.asset("assets/images/round_forward.png", height: 25),
          onPressed: () {
            if (currentIndex < columnCount - 1) {
              scrollToIndex(currentIndex + 1);
            }
          },
        ),
      ],
    );
  }

  // ------------------------------- CARD UI -------------------------------
  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              item['image'],
              height: 75,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    Image.asset("assets/images/money.png",
                        height: 20, width: 20),
                    const SizedBox(width: 4),
                    Text(
                      item['price'],
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Image.asset("assets/images/a6.png",
                        height: 20, width: 20),
                    const SizedBox(width: 4),
                    Text(
                      item['time'],
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

