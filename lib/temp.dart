// // // import 'package:flutter/material.dart';
// // // import 'package:wallpaper_app_flutter/controller/api_operations.dart';

// // // import '../../model/photos_model.dart';

// // // class HomesScreen extends StatefulWidget {
// // //   const HomesScreen({Key? key}) : super(key: key);

// // //   @override
// // //   State<HomesScreen> createState() => _HomesScreenState();
// // // }

// // // class _HomesScreenState extends State<HomesScreen> {
// // //   List<AnimeWallpaper> wallpapers = [];

// // //   fetchRandomWallpapers() async {
// // //     try {
// // //       List<AnimeWallpaper> fetchedWallpapers = await WallpaperAPI().fetchRandomWallpapers();
// // //       setState(() {
// // //         wallpapers = fetchedWallpapers;
// // //       });
// // //     } catch (error) {
// // //       print('Error: $error');
// // //       // Handle the error if needed
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     fetchRandomWallpapers();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Anime Wallpapers'),
// // //         centerTitle: true,
// // //       ),
// // //       body: GridView.builder(
// // //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// // //           crossAxisCount: 2,
// // //           crossAxisSpacing: 10,
// // //           mainAxisSpacing: 10,
// // //         ),
// // //         itemCount: wallpapers.length,
// // //         itemBuilder: (context, index) => Container(
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(20),
// // //           ),
// // //           child: ClipRRect(
// // //             borderRadius: BorderRadius.circular(20),
// // //             child: Image.network(
// // //               wallpapers[index].artUrl,
// // //               fit: BoxFit.cover,
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// // GridView.builder(
// //                 physics: const BouncingScrollPhysics(),
// //                 itemCount: wallpapers.length,
// //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 2,
// //                     childAspectRatio: 0.6,
// //                     crossAxisSpacing: 10,
// //                     mainAxisSpacing: 10),
// //                 itemBuilder: (context, index) => Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(20),
// //                     child: Image.network(
// //                       wallpapers[index].artUrl,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //               ),




// // Container(
// //               child: StreamBuilder(
// //                   stream: FirebaseFirestore.instance
// //                       .collection('wallpapers')
// //                       .snapshots(),
// //                   builder: (BuildContext context,
// //                       AsyncSnapshot<QuerySnapshot> snapshot) {
// //                     if (!snapshot.hasData) {
// //                       return const Center(child: CircularProgressIndicator());
// //                     }
// //                     if (snapshot.data == null) {
// //                       return const Center(child: Text("NO DATA EXISTS"));
// //                     }
// //                     final data = snapshot.data!.docs;
// //                     return 
                    
// //                   }),
// //             ),



//             // Column(
//             //           children: [
//             //             SizedBox(
//             //               height: 70,
//             //               width: MediaQuery.of(context).size.width,
//             //               child: ListView.builder(
//             //                   shrinkWrap: true,
//             //                   itemCount: 7,
//             //                   scrollDirection: Axis.horizontal,
//             //                   itemBuilder: (context, index) {
//             //                     return const CategoryBlock();
//             //                   }),
//             //             ),
//             //             const SizedBox(
//             //               height: 30,
//             //             ),
//             //             Container(
//             //               margin: const EdgeInsets.symmetric(horizontal: 10),
//             //               height: MediaQuery.of(context).size.height - 200,
//             //               child: GridView.builder(
//             //                 physics: const BouncingScrollPhysics(),
//             //                 itemCount: data.length,
//             //                 gridDelegate:
//             //                     const SliverGridDelegateWithFixedCrossAxisCount(
//             //                         crossAxisCount: 2,
//             //                         childAspectRatio: 0.6,
//             //                         crossAxisSpacing: 10,
//             //                         mainAxisSpacing: 10),
//             //                 itemBuilder: (context, index) => InkWell(
//             //                   onTap: () {
//             //                     Navigator.push(
//             //                         context, MaterialPageRoute(builder:(context) => FullScreen(imgUrl: data[index]['urls'][0]),),);
//             //                   },
//             //                   child: Container(
//             //                     decoration: BoxDecoration(
//             //                       borderRadius: BorderRadius.circular(20),
//             //                     ),
//             //                     child: ClipRRect(
//             //                       borderRadius: BorderRadius.circular(20),
//             //                       child: Image.network(
//             //                         data[index]['urls'][0],
//             //                         fit: BoxFit.cover,
//             //                       ),
//             //                     ),
//             //                   ),
//             //                 ),
//             //               ),
//             //             ),
//             //           ],





// //             import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:wallpaper_app_flutter/views/screens/full_screen.dart';
// // import 'package:wallpaper_app_flutter/views/screens/widgets/categories_widget.dart';
// // import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';
// // import 'package:wallpaper_app_flutter/views/screens/widgets/drawer_widget.dart';
// // import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// //   void _openDrawer() {
// //     _scaffoldKey.currentState?.openDrawer();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _scaffoldKey,
// //       drawer: DrawerWidget(),
// //       body: Container(
// //           height: MediaQuery.of(context).size.height - 50,
// //           width: MediaQuery.of(context).size.width,
// //           decoration: const BoxDecoration(
// //             image: DecorationImage(
// //                 image: AssetImage('assets/images/itachi_bg.jpg'),
// //                 fit: BoxFit.cover),
// //           ),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 const SizedBox(
// //                   height: 50,
// //                 ),
// //                 Row(
// //                   children: [
// //                     const SizedBox(
// //                       width: 20,
// //                     ),
// //                     InkWell(
// //                       onTap: () {
// //                         _openDrawer();
// //                       },
// //                       child: Container(
// //                         height: 50,
// //                         width: 50,
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(15),
// //                         ),
// //                         child: const Icon(
// //                           CupertinoIcons.line_horizontal_3,
// //                           size: 34,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(
// //                   height: 60,
// //                 ),
// //                 Container(
// //                     width: double.infinity,
// //                     child: const Text(
// //                       'Looking for high quality \n free wallpapers',
// //                       style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 30,
// //                           fontWeight: FontWeight.bold),
// //                       textAlign: TextAlign.center,
// //                     )),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 const SearchBarTab(),
// //                 const SizedBox(
// //                   height: 20,
// //                 ),
// //                 Container(
// //                   width: double.infinity,
// //                   height: MediaQuery.of(context).size.height - 60,
// //                   padding: const EdgeInsets.only(top: 20, left: 20),
// //                   decoration: const BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.only(
// //                         topLeft: Radius.circular(40),
// //                         topRight: Radius.circular(40)),
// //                   ),
// //                   child: StreamBuilder(
// //                       stream: FirebaseFirestore.instance
// //                           .collection('wallpapers')
// //                           .snapshots(),
// //                       builder: (BuildContext context,
// //                           AsyncSnapshot<QuerySnapshot> snapshot) {
// //                         if (!snapshot.hasData) {
// //                           return const Center(
// //                               child: CircularProgressIndicator());
// //                         }
// //                         if (snapshot.data == null) {
// //                           return const Center(child: Text("NO DATA EXISTS"));
// //                         }
// //                         final data = snapshot.data!.docs;
// //                         // Filter wallpapers for each category
// //                         List<DocumentSnapshot> onePieceWallpapers = data
// //                             .where((doc) => doc['category'] == 'one piece')
// //                             .toList();
// //                         List<DocumentSnapshot> cat1Wallpapers = data
// //                             .where((doc) => doc['category'] == 'cat1')
// //                             .toList();
// //                         List<DocumentSnapshot> cat2Wallpapers = data
// //                             .where((doc) => doc['category'] == 'cat2')
// //                             .toList();

// //                         print(
// //                             "One Piece Wallpapers: ${onePieceWallpapers.length}");
// //                         print("Cat1 Wallpapers: ${cat1Wallpapers.length}");
// //                         print("Cat2 Wallpapers: ${cat2Wallpapers.length}");

// //                         return Column(children: [
// //                           CategoriesWidget(
// //                             category: 'One Piece',
// //                             wallpapers: onePieceWallpapers,
// //                           ),
// //                           SizedBox(height: 20),
// //                           CategoriesWidget(
// //                             category: 'cat1',
// //                             wallpapers: cat1Wallpapers,
// //                           ),
// //                           SizedBox(height: 20),
// //                           CategoriesWidget(
// //                             category: 'cat2',
// //                             wallpapers: cat2Wallpapers,
// //                           ),
// //                         ]);
// //                       }),
// //                 ),
// //               ],
// //             ),
// //           )),
// //     );
// //   }
// // }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:wallpaper_app_flutter/views/screens/widgets/categories_widget.dart';
// import 'package:wallpaper_app_flutter/views/screens/widgets/drawer_widget.dart';
// import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // State variables to store the fetched data
//   List<DocumentSnapshot> onePieceWallpapers = [];
//   List<DocumentSnapshot> cat1Wallpapers = [];
//   List<DocumentSnapshot> cat2Wallpapers = [];

//   // Function to fetch data from Firestore and store it in state variables
//   Future<void> fetchData() async {
//     final snapshot =
//         await FirebaseFirestore.instance.collection('wallpapers').get();

//     final data = snapshot.docs;

//     // Filter wallpapers for each category and store in state variables
//     setState(() {
//       onePieceWallpapers = data.where((doc) => doc['category'] == 'one piece').toList();
//       cat1Wallpapers = data.where((doc) => doc['category'] == 'cat1').toList();
//       cat2Wallpapers = data.where((doc) => doc['category'] == 'cat2').toList();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Call fetchData() when the app is first initialized
//     fetchData();
//   }


//   // Function to open the drawer
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void _openDrawer() {
//     _scaffoldKey.currentState?.openDrawer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: DrawerWidget(),
//       body: Container(
//         height: MediaQuery.of(context).size.height - 50,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/itachi_bg.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 children: [
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       _openDrawer();
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: const Icon(
//                         CupertinoIcons.line_horizontal_3,
//                         size: 34,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 60,
//               ),
//               Container(
//                 width: double.infinity,
//                 child: const Text(
//                   'Looking for high quality \n free wallpapers',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SearchBarTab(),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height - 60,
//                 padding: const EdgeInsets.only(top: 20, left: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     CategoriesWidget(
//                       category: 'One Piece',
//                       wallpapers: onePieceWallpapers,
//                     ),
//                     SizedBox(height: 20),
//                     CategoriesWidget(
//                       category: 'cat1',
//                       wallpapers: cat1Wallpapers,
//                     ),
//                     SizedBox(height: 20),
//                     CategoriesWidget(
//                       category: 'cat2',
//                       wallpapers: cat2Wallpapers,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import 'package:provider/provider.dart';

// // Step 2: Create a FavoriteProvider class to manage the list of favorites
// class FavoriteProvider with ChangeNotifier {
//   List<String> _favorites = [];

//   List<String> get favorites => _favorites;

//   void addToFavorites(String imgUrl) {
//     if (!_favorites.contains(imgUrl)) {
//       _favorites.add(imgUrl);
//       notifyListeners();
//     }
//   }

//   void removeFromFavorites(String imgUrl) {
//     _favorites.remove(imgUrl);
//     notifyListeners();
//   }
// }

// class FullScreen extends StatelessWidget {
//   const FullScreen({Key? key, required this.imgUrl}) : super(key: key);

//   final String imgUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         //... your existing code
//         child: Stack(
//           children: [
//             //... your existing code

//             Positioned(
//               bottom: 60,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       //... your existing code
//                       child: LikeButton(
//                         size: 30,
//                         likeBuilder: (bool isLiked) {
//                           // Step 3: Check if the wallpaper is in favorites
//                           final isFavorite = Provider.of<FavoriteProvider>(
//                             context,
//                             listen: false,
//                           ).favorites.contains(imgUrl);

//                           return Icon(
//                             Icons.favorite,
//                             color: isFavorite ? Colors.red : Colors.grey,
//                             size: 30,
//                           );
//                         },
//                         // Step 4: Handle the like button tap
//                         onTap: (isLiked) {
//                           final favoriteProvider = Provider.of<FavoriteProvider>(
//                             context,
//                             listen: false,
//                           );

//                           if (isLiked) {
//                             favoriteProvider.removeFromFavorites(imgUrl);
//                           } else {
//                             favoriteProvider.addToFavorites(imgUrl);
//                           }

//                           return !isLiked;
//                         },
//                       ),
//                     ),
//                     //... your existing code
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
