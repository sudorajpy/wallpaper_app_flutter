import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class TempScreen extends StatelessWidget {
//   const TempScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Temp'),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final categoryImagesMap = <String, List<String>>{};

//             snapshot.data!.docs.forEach((doc) {
//               final category = doc['category'] as String;
//               final imageUrl = doc['urls'][0] as String;

//               if (!categoryImagesMap.containsKey(category)) {
//                 categoryImagesMap[category] = [];
//               }

//               categoryImagesMap[category]!.add(imageUrl);
//             });

//             return ListView.builder(
//               itemCount: categoryImagesMap.keys.length,
//               itemBuilder: (context, index) {
//                 final category = categoryImagesMap.keys.elementAt(index);
//                 final categoryImages = categoryImagesMap[category]!;

//                 return Column(
//                   children: [
//                     Text(
//                       category,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       height: 300,
//                       width: MediaQuery.of(context).size.width,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             width: 200,
//                             height: 200,
//                             child: Image.network(
//                               categoryImages[index],
//                               fit: BoxFit.cover,
//                             ),
//                           );
//                         },
//                         itemCount: categoryImages.length,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:math';

import 'package:wallpaper_app_flutter/views/screens/category.dart';

// ...

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            // Create a list of all categories and shuffle them randomly.
            List<String> allCategories = [];
            snapshot.data!.docs.forEach((doc) {
              final category = doc['category'] as String;
              allCategories.add(category);
            });
            allCategories = allCategories.toSet().toList(); // Remove duplicates
            allCategories.shuffle();

            // Pick the first three categories from the shuffled list.
            final selectedCategories = allCategories.take(3).toList();

            return ListView.builder(
              itemCount: selectedCategories.length,
              itemBuilder: (context, index) {
                final category = selectedCategories[index];
                final categoryImages = <String>[];

                snapshot.data!.docs.forEach((doc) {
                  final docCategory = doc['category'] as String;
                  final imageUrl = doc['urls'][0] as String;
                  if (docCategory == category) {
                    categoryImages.add(imageUrl);
                  }
                });

                return Column(
                  children: [
                   Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular in $category',
              style: TextStyle(color: Colors.black, fontSize: 24),
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
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
                    Container(
                      height: 200,
                      
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(categoryImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        itemCount: categoryImages.length  >=5 ? 5 : categoryImages.length,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
