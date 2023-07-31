import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/category.dart';
import 'package:wallpaper_app_flutter/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CategoryScreen(),
    );
  }
}
