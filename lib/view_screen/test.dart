import 'package:flutter/material.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
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
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'https://picsum.photos/200'},
    {'name': 'Roma', 'price': '5 AED', 'time': '10m', 'image': 'https://picsum.photos/210'},
    {'name': 'Silmont', 'price': '2.5 AED', 'time': '12m', 'image': 'https://picsum.photos/220'},
    {'name': 'Buda', 'price': '5 AED', 'time': '6m', 'image': 'https://picsum.photos/230'},
  ];

  final List<Map<String, dynamic>> meatlessItems = [
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'https://picsum.photos/240'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'https://picsum.photos/250'},
    {'name': 'Everest', 'price': '5 AED', 'time': '6m', 'image': 'https://picsum.photos/260'},
    {'name': 'Rabat', 'price': '10 AED', 'time': '6m', 'image': 'https://picsum.photos/270'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Sticky Header (Category Tabs)
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 2,
            automaticallyImplyLeading: false,
            title: _buildCategoryTabs(),
          ),

          // Scrollable Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Meatness'),
                  const SizedBox(height: 10),
                  _buildFoodList(meatItems),
                  const SizedBox(height: 25),
                  _buildSectionTitle('Meatless'),
                  const SizedBox(height: 10),
                  _buildFoodList(meatlessItems),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final isSelected = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(Icons.filter_alt_outlined, size: 20),
        ),
      ],
    );
  }

  Widget _buildFoodList(List<Map<String, dynamic>> items) {
    return SizedBox(
      height: 300, // Two rows like image
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: (items.length / 2).ceil(),
        itemBuilder: (context, i) {
          final start = i * 2;
          final end = (start + 2).clamp(0, items.length);
          final rowItems = items.sublist(start, end);

          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Row(children: rowItems.map((item) => _buildFoodCard(item)).toList()),
                const SizedBox(height: 10),
                if (i == (items.length / 2).floor()) _buildArrowButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item['image'],
              height: 70,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.wallet, size: 14),
              const SizedBox(width: 4),
              Text(item['price'], style: const TextStyle(fontSize: 12)),
              const Spacer(),
              const Icon(Icons.timer, size: 14),
              const SizedBox(width: 4),
              Text(item['time'], style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
