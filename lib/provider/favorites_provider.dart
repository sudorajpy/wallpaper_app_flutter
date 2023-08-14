

import 'package:flutter/material.dart';


// Step 2: Create a FavoriteProvider class to manage the list of favorites
class FavoriteProvider with ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addToFavorites(String imgUrl) {
    if (!_favorites.contains(imgUrl)) {
      _favorites.add(imgUrl);
      notifyListeners();
    }
  }

  void removeFromFavorites(String imgUrl) {
    if (_favorites.contains(imgUrl)) {
      _favorites.remove(imgUrl);
      notifyListeners();
    }
  }
}
