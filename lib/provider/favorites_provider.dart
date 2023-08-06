// import 'package:flutter/material.dart';

// import '../model/wallpaper.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Wallpaper> _favorites = [];

//   List<Wallpaper> get favorites => _favorites;

//   void addToFavorites(Wallpaper wallpaper) {
//     _favorites.add(wallpaper);
//     notifyListeners();
//   }

//   void removeFromFavorites(Wallpaper wallpaper) {
//     _favorites.remove(wallpaper);
//     notifyListeners();
//   }
// }




import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

// Step 2: Create a FavoriteProvider class to manage the list of favorites
class FavoriteProvider with ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addToFavorites(String imgUrl) {
    if (!_favorites.contains(imgUrl)) {
      _favorites.add(imgUrl);
      notifyListeners();
    }
  }

  void removeFromFavorites(String imgUrl) {
    _favorites.remove(imgUrl);
    notifyListeners();
  }
}


