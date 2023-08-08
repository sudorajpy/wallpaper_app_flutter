import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/full_screen.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResult = [];
  void searchFromFirebase(query) async {
    final result = await FirebaseFirestore.instance
        .collection('wallpapers')
        .where('tags', arrayContains: query)
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchBar(
                  hintText: 'Search Wallpaper',
                  leading: const Icon(CupertinoIcons.search),
                  onChanged: (value) {
                    searchFromFirebase(value);
                  },
                )
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height - 200,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: searchResult.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                    imgUrl: searchResult[index]['urls'][0],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          searchResult[index]['urls'][0],
                          fit: BoxFit.cover,
                        ),
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
