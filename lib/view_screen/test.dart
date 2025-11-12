import 'package:flutter/material.dart';

class BurgerBitesScreen extends StatelessWidget {
  const BurgerBitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

              // Title
              const Text(
                "Burger Bites",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Burger with tags around it
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Burger image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/burger.png',
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Surrounding tags
                    Positioned(top: 0, child: _buildTag("Bun")),
                    Positioned(bottom: 0, child: _buildTag("Salad")),
                    Positioned(left: 0, child: _buildTag("Cheese")),
                    Positioned(right: 0, child: _buildTag("Tomatoes")),
                    Positioned(top: 30, left: 30, child: _buildTag("Steak")),
                    Positioned(top: 30, right: 30, child: _buildTag("Sauce")),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Extra Sauce Section
              _buildSectionHeader("Extra Sauce", count: 1),
              const SizedBox(height: 10),
              _buildHorizontalList([
                'assets/pepperoni.png',
                'assets/caviar.png',
                'assets/tomato.png',
                'assets/mayonesa.png',
                'assets/yassa.png',
              ]),

              const SizedBox(height: 25),

              // Suggestion Section
              _buildSectionHeader("Suggestion", count: 2),
              const SizedBox(height: 10),
              _buildHorizontalList([
                'assets/coke.png',
                'assets/beer.png',
                'assets/pepsi.png',
                'assets/wine.png',
              ]),

              const SizedBox(height: 25),

              // Desserts
              _buildHorizontalList([
                'assets/cake1.png',
                'assets/cake2.png',
                'assets/cake3.png',
                'assets/cake4.png',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Tag widget
  Widget _buildTag(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      ),
    );
  }

  // Section title with badge
  Widget _buildSectionHeader(String title, {int count = 0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (count > 0)
          Container(
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  // Horizontal list of images
  Widget _buildHorizontalList(List<String> imagePaths) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePaths[index],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
