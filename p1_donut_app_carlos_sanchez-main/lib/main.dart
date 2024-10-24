import 'package:flutter/material.dart';
import 'package:p1_donut_app_carlos_sanchez/pages/home_pages.dart';
import 'package:provider/provider.dart';
import 'car/car_model.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MainApp(),),);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePages(),
      theme: ThemeData(
      tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink)
      )
    );
  }
}