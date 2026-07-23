import 'package:first_flutter_task/data/constants.dart';
import 'package:first_flutter_task/views/widgets/categoryCards.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopper"),
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
                      child: CategoryCard(
                        title: categories[index],
                        isSelected: index == 0,
                      ),
                    );
                  },
                ),
              )





            ],
          ) ,
        ),
      ),

    );
  }
}