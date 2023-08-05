// // import 'package:flutter/material.dart';
// // import 'package:wallpaper_app_flutter/controller/api_operations.dart';

// // import '../../model/photos_model.dart';

// // class HomesScreen extends StatefulWidget {
// //   const HomesScreen({Key? key}) : super(key: key);

// //   @override
// //   State<HomesScreen> createState() => _HomesScreenState();
// // }

// // class _HomesScreenState extends State<HomesScreen> {
// //   List<AnimeWallpaper> wallpapers = [];

// //   fetchRandomWallpapers() async {
// //     try {
// //       List<AnimeWallpaper> fetchedWallpapers = await WallpaperAPI().fetchRandomWallpapers();
// //       setState(() {
// //         wallpapers = fetchedWallpapers;
// //       });
// //     } catch (error) {
// //       print('Error: $error');
// //       // Handle the error if needed
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchRandomWallpapers();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Anime Wallpapers'),
// //         centerTitle: true,
// //       ),
// //       body: GridView.builder(
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           crossAxisSpacing: 10,
// //           mainAxisSpacing: 10,
// //         ),
// //         itemCount: wallpapers.length,
// //         itemBuilder: (context, index) => Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: ClipRRect(
// //             borderRadius: BorderRadius.circular(20),
// //             child: Image.network(
// //               wallpapers[index].artUrl,
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// GridView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: wallpapers.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.6,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemBuilder: (context, index) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.network(
//                       wallpapers[index].artUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),




// Container(
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('wallpapers')
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     if (snapshot.data == null) {
//                       return const Center(child: Text("NO DATA EXISTS"));
//                     }
//                     final data = snapshot.data!.docs;
//                     return 
                    
//                   }),
//             ),



            // Column(
            //           children: [
            //             SizedBox(
            //               height: 70,
            //               width: MediaQuery.of(context).size.width,
            //               child: ListView.builder(
            //                   shrinkWrap: true,
            //                   itemCount: 7,
            //                   scrollDirection: Axis.horizontal,
            //                   itemBuilder: (context, index) {
            //                     return const CategoryBlock();
            //                   }),
            //             ),
            //             const SizedBox(
            //               height: 30,
            //             ),
            //             Container(
            //               margin: const EdgeInsets.symmetric(horizontal: 10),
            //               height: MediaQuery.of(context).size.height - 200,
            //               child: GridView.builder(
            //                 physics: const BouncingScrollPhysics(),
            //                 itemCount: data.length,
            //                 gridDelegate:
            //                     const SliverGridDelegateWithFixedCrossAxisCount(
            //                         crossAxisCount: 2,
            //                         childAspectRatio: 0.6,
            //                         crossAxisSpacing: 10,
            //                         mainAxisSpacing: 10),
            //                 itemBuilder: (context, index) => InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context, MaterialPageRoute(builder:(context) => FullScreen(imgUrl: data[index]['urls'][0]),),);
            //                   },
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(20),
            //                     ),
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(20),
            //                       child: Image.network(
            //                         data[index]['urls'][0],
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],