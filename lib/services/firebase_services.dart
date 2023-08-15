import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variables to store fetched data
  List<String> categories = [];
  List<String> urls = [];
  List<String> tags = [];
  List<String> names = [];

  // Method to load data from Firestore
  Future<void> loadData() async {
    try {
      final snapshot = await _firestore.collection('wallpapers').get();

      categories =
          snapshot.docs.map((doc) => doc['category'].toString()).toList();
      urls = snapshot.docs.map((doc) => doc['urls'][0].toString()).toList();

      // Assuming tags and names are in the Firestore document structure
      tags = snapshot.docs.map((doc) => doc['tags'][0].toString()).toList();
      names = snapshot.docs.map((doc) => doc['name'].toString()).toList();
     
    } catch (e) {
      print('Error loading data: $e');
    }
  }
}
