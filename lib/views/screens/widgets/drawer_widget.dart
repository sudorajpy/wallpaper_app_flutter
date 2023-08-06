import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../category.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          // StreamBuilder to display categories
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final categories = <String>{};
              final categoryImages = <String, String>{};

              snapshot.data!.docs.forEach((doc) {
                final category = doc['category'] as String;
                final imageUrl = doc['urls'][0] as String;

                if (!categories.contains(category)) {
                  categories.add(category);
                  categoryImages[category] = imageUrl;
                }
              });

              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 2), // Adjust the spacing as needed
                  itemBuilder: (context, index) {
                    final category = categories.elementAt(index);
                    final imageUrl = categoryImages[category];

                    return Card(
                      child: ListTile(
                        title: Text(category),
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            imageUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                category: category,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
