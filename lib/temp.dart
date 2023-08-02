import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/controller/api_operations.dart';

import '../../model/photos_model.dart';

class HomesScreen extends StatefulWidget {
  const HomesScreen({Key? key}) : super(key: key);

  @override
  State<HomesScreen> createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {
  List<AnimeWallpaper> wallpapers = [];

  fetchRandomWallpapers() async {
    try {
      List<AnimeWallpaper> fetchedWallpapers = await WallpaperAPI().fetchRandomWallpapers();
      setState(() {
        wallpapers = fetchedWallpapers;
      });
    } catch (error) {
      print('Error: $error');
      // Handle the error if needed
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRandomWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Wallpapers'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: wallpapers.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              wallpapers[index].artUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
