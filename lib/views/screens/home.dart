import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/full_screen.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/cat_block.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/categories_widget.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/itachi_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      CupertinoIcons.line_horizontal_3,
                      size: 34,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                  width: double.infinity,
                  child: const Text(
                    'Looking for high quality \n free wallpapers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 20,
              ),
              const SearchBarTab(),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 60,
                padding: const EdgeInsets.only(top: 20, left: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('wallpapers')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.data == null) {
                        return const Center(child: Text("NO DATA EXISTS"));
                      }
                      final data = snapshot.data!.docs;
                      // Filter wallpapers for each category
                      List<DocumentSnapshot> onePieceWallpapers = data
                          .where((doc) => doc['category'] == 'one piece')
                          .toList();
                      List<DocumentSnapshot> cat1Wallpapers = data
                          .where((doc) => doc['category'] == 'cat1')
                          .toList();
                      List<DocumentSnapshot> cat2Wallpapers = data
                          .where((doc) => doc['category'] == 'cat2')
                          .toList();

                      print(
                          "One Piece Wallpapers: ${onePieceWallpapers.length}");
                      print("Cat1 Wallpapers: ${cat1Wallpapers.length}");
                      print("Cat2 Wallpapers: ${cat2Wallpapers.length}");

                      return Column(children: [
                        CategoriesWidget(
                          category: 'One Piece',
                          wallpapers: onePieceWallpapers,
                        ),
                        SizedBox(height: 20),
                        CategoriesWidget(
                          category: 'cat1',
                          wallpapers: cat1Wallpapers,
                        ),
                        SizedBox(height: 20),
                        CategoriesWidget(
                          category: 'cat2',
                          wallpapers: cat2Wallpapers,
                        ),
                      ]);
                    }),
              ),
            ],
          ),
        ));
  }
}

