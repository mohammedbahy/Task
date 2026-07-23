import 'package:first_flutter_task/data/constants.dart';
import 'package:flutter/material.dart';

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
                Card(
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
                )
              ]
              ),

              SearchBar(
                hintText: 'Search products...',
                leading: const Icon(Icons.search),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),

              )
            ],
          ) ,




        ),


      ),

    );
  }
}