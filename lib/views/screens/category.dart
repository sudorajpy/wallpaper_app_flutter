import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallpaper_app_flutter/views/screens/full_screen.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';

import '../../provider/favorites_provider.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/search');
        //     },
        //     icon: const Icon(Icons.search),
        //   ),
        // ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('wallpapers')
                    .where('category', isEqualTo: category)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final favoriteProvider = Provider.of<FavoriteProvider>(context);

                  final wallpapers = <String, bool>{};
                  snapshot.data!.docs.forEach((doc) {
                    final imgUrl = doc['urls'][0] as String;
                    final isLiked = favoriteProvider.favorites.contains(imgUrl);
                    wallpapers[imgUrl] = isLiked;
                  });

                  return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: wallpapers.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      final imgUrl = wallpapers.keys.elementAt(index);
                      final isLiked = wallpapers[imgUrl] ?? false;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreen(
                                imgUrl: imgUrl,// Pass the liked state to FullScreen
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(imgUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
