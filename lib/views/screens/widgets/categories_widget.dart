import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../category.dart';
import '../full_screen.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.category,
    required this.wallpapers,
  });
  final String category;
  final List<DocumentSnapshot> wallpapers;

  @override
  Widget build(BuildContext context) {
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
        // const SizedBox(
        //   height: 5,
        // ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FullScreen(
                      imgUrl: wallpapers[index]['urls'][0],
                    );
                  }),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                height: 200,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    wallpapers[index]['urls'][0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            itemCount: wallpapers.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
