import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/controller/api_operations.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/cat_block.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

import '../../model/photos_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  // getTrandingWallpapers() async {
  //   photos = await fetchData();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   getTrandingWallpapers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomeAppBar(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchBarTab(),
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryBlock();
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height - 200,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: wallpapers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
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
              )
            ],
          ),
        ));
  }
}
