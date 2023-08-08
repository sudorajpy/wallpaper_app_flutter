import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../category.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // StreamBuilder to display categories
          Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
    
                child: StreamBuilder(
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
