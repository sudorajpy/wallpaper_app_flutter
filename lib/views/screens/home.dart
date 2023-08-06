import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/categories_widget.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/drawer_widget.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

import '../../services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {







  // State variables to store the fetched data
  List<DocumentSnapshot>  onePieceWallpapers = [];
  List<DocumentSnapshot> cat1Wallpapers = [];
  List<DocumentSnapshot> cat2Wallpapers = [];

  // Function to fetch data from Firestore and store it in state variables
  Future<void> fetchData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('wallpapers').get();

    final data = snapshot.docs;

    // Filter wallpapers for each category and store in state variables
    setState(() {
      onePieceWallpapers =
          data.where((doc) => doc['category'] == 'one piece').toList();
      cat1Wallpapers = data.where((doc) => doc['category'] == 'cat1').toList();
      cat2Wallpapers = data.where((doc) => doc['category'] == 'cat2').toList();
    });
  }

  @override
  void initState() {
    super.initState();
    // Call fetchData() when the app is first initialized
    fetchData();
  }

  // Function to open the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
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
              Container(
                width: double.infinity,
                child: const Text(
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
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
