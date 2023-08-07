import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app_flutter/provider/favorites_provider.dart';
import 'package:wallpaper_app_flutter/views/screens/dashboard_screen.dart';
import 'package:wallpaper_app_flutter/views/screens/home.dart';
import 'package:wallpaper_app_flutter/views/screens/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}
