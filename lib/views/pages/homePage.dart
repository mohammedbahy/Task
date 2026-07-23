import 'dart:async';

import 'package:first_flutter_task/data/constants.dart';
import 'package:first_flutter_task/views/widgets/categoryCards.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';
import '../widgets/banner_card.dart';
import '../widgets/product_card.dart';

final List<String> categories = [
  "All",
  "Electronics",
  "Clothing",
  "Home",
  "Sports",
  "Beauty",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();

  int selectedCategory = 0;

  int _currentPage = 0;

  final List<Map<String, String>> banners = [
    {
      'title': 'Summer Sale',
      'subtitle': 'Up to 50% Off',
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
    },
    {
      'title': 'New Arrivals',
      'subtitle': 'Latest Collection',
      'image': 'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=600',
    },
    {
      'title': 'Sports Deals',
      'subtitle': 'Everything You Need',
      'image': 'https://images.unsplash.com/photo-1514996937319-344454492b37?w=600',
    },
  ];

  final products = [
    Product(
      image: "https://picsum.photos/id/10/400/400",
      name: "Wireless Headphones",
      price: 120,
      rating: 4.8,
    ),
    Product(
      image: "https://picsum.photos/id/20/400/400",
      name: "Smart Watch",
      price: 250,
      rating: 4.7,
    ),
    Product(
      image: "https://picsum.photos/id/30/400/400",
      name: "Laptop",
      price: 999,
      rating: 4.9,
    ),
    Product(
      image: "https://picsum.photos/id/40/400/400",
      name: "Gaming Mouse",
      price: 79,
      rating: 4.6,
    ),
    Product(
      image: "https://picsum.photos/id/50/400/400",
      name: "Bluetooth Speaker",
      price: 150,
      rating: 4.5,
    ),
    Product(
      image: "https://picsum.photos/id/60/400/400",
      name: "Running Shoes",
      price: 180,
      rating: 4.7,
    ),
    Product(
      image: "https://picsum.photos/id/70/400/400",
      name: "Backpack",
      price: 65,
      rating: 4.4,
    ),
    Product(
      image: "https://picsum.photos/id/80/400/400",
      name: "Coffee Mug",
      price: 25,
      rating: 4.3,
    ),
  ];

  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopper",
        style: KTextStyle.cardTitle,),
        centerTitle: true,
        actions: [Icon(Icons.notifications_none_sharp)],
      ),
      drawer: Drawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:Column(
            spacing: 20.0,
            children: [
              Row(
                spacing: 10.0,
                children: [
                  CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/profile.jpeg') ,
                  ),

                  SizedBox.fromSize(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, User ",
                          style: KTextStyle.titleText,
                        ),
                        Text(
                          "What do you want to buy today?",
                          style: KTextStyle.discriptionText,
                        )
                      ],
                    ),
                  ),

                ]
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.tune),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: CategoryCard(
                          title: categories[index],
                          isSelected: selectedCategory == index,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 220,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return BannerCard(
                      title: banners[index]['title']!,
                      subtitle: banners[index]['subtitle']!,
                      imageUrl: banners[index]['image']!,
                    );
                  },
                ),
              ),


              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  banners.length,
                      (index) => Container(
                    width: _currentPage == index ? 22 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See more"),
                  ),
                ],
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ProductCard(
                      product: products[index],
                    ),
                  );
                },
              )



            ],
          ) ,
        ),
      ),

    );
  }
}