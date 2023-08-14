import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/full_screen.dart';
import 'package:wallpaper_app_flutter/views/screens/search.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/drawer_widget.dart';

import 'category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  // Function to open the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/itachi_bg.jpg'),
            fit: BoxFit.cover,
          ),
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
                  InkWell(
                    onTap: () {
                      _openDrawer();
                    },
                    child: Container(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Looking for high quality \n free wallpapers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.search,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search here...',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only( left: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('wallpapers')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Create a list of all categories and shuffle them randomly.
                      List<String> allCategories = [];
                      for (var doc in snapshot.data!.docs) {
                        final category = doc['category'] as String;
                        allCategories.add(category);
                      }
                      allCategories =
                          allCategories.toSet().toList(); // Remove duplicates
                      allCategories.shuffle();

                      // Pick the first three categories from the shuffled list.
                      final selectedCategories = allCategories.take(3).toList();

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedCategories.length,
                        itemBuilder: (context, index) {
                          final category = selectedCategories[index];
                          final categoryImages = <String>[];

                          for (var doc in snapshot.data!.docs) {
                            final docCategory = doc['category'] as String;
                            final imageUrl = doc['urls'][0] as String;
                            if (docCategory == category) {
                              categoryImages.add(imageUrl);
                            }
                          }
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Popular in $category',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CategoryScreen(
                                            category: category,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'View All',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FullScreen(
                                              imgUrl: categoryImages[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        width: 150,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                categoryImages[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: categoryImages.length >= 5
                                      ? 5
                                      : categoryImages.length,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
