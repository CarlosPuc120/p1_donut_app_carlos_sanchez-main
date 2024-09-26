import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/Utilis/my_tab.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State <HomePages> {
  List<Widget> myTabs = [
    //donutTab
     const MyTab(
      iconPath: 'lib/icons/donut.png',
    ),
    //burgerTab
      const MyTab(
      iconPath: 'lib/icons/burger.png',
    ),
    //smoothieab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),
    //pancakeTab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),
    //pizzaTab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
    ),
  ];

  @override
  Widget build(context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
             actions: const [Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          )],

        ),
        body: Column(
          children: [
            //texto " I want to it"
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text("Eat",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            //Tab bar
            TabBar(tabs: myTabs),
            //Tab bar view
            Expanded(
              child: TabBarView(
                children: myTabs.map((tab) => Center(child: tab)).toList(),
              ),
            ),
            //Total del carrito
          ],
        ),
      ),
    );
  }
}