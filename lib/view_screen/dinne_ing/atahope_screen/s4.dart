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
  final List<String> categories = [
    'Appetizers',
    'Beverages',
    'Desserts',
    'Main course',
    'Side',
    'Special',
  ];

  final List<Map<String, dynamic>> meatItems = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
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
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildCategoryTabs(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildSectionTitle('Meatness'),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildFoodList(meatItems),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildSectionTitle('Meatless'),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: _buildFoodList(meatlessItems),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Wrap(
        spacing: 10, // space between items horizontally
        runSpacing: 10, // space between lines
        alignment: WrapAlignment.center, // center all buttons
        children: List.generate(categories.length, (index) {
          final isSelected = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(35),
                //border: Border.all(color: Colors.purple, width: 1),
              ),
              child: Text(
                categories[index],
                style:GoogleFonts.montserrat(
                  textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 20,
                    fontWeight: FontWeight.w400,),
                )

              ),
            ),
          );
        }),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
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
              child: Text(
                title,
                textAlign: TextAlign.center,
                  style:GoogleFonts.montserrat(
                    textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 20,
                      fontWeight: FontWeight.w400,),
                  )
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
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // let main scroll handle
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two cards per row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.3, // wider look (since image is at left)
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildFoodCard(item);
            },
          ),
        ),
        IconButton(
          icon: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset("assets/images/round_forward.png")),
          onPressed: () {
          },
        ),
      ],
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Container(
      height: 70,
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
              height: 70,
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
                    const SizedBox(width: 25),
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
