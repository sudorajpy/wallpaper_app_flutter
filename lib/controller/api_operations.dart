// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:wallpaper_app_flutter/model/photos_model.dart';

// class ApiOperations {
//  static List<PhotosModel> photos = [];
//   static Future<List<PhotosModel>> getTrandingWallpapers() async {

// List<PhotosModel> fetchedPhotos = [];

//     await http.get(Uri.parse("https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/random"), headers: {
//       'X-RapidAPI-Key': 'apiKey',

//     }).then((value) {
//       Map<String, dynamic> json = jsonDecode(value.body);

//       List photos = json["photos"];
//       photos.forEach((element) {
//        fetchedPhotos.add(PhotosModel.fromApiToApp(element));
//       });
//     });
//     photos = fetchedPhotos;
//     return photos;
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../model/photos_model.dart';

// class PhotosModel {
//   final String imgSrc;
//   final String photoName;

//   PhotosModel({required this.imgSrc, required this.photoName});

//   static PhotosModel fromApiToApp(Map<String, dynamic> json) {
//     return PhotosModel(
//       imgSrc: json["src"]["portrait"],
//       photoName: json["alt"],
//     );
//   }
// }

// const String url = 'https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/random';
// const Map<String, String> headers = {
//   'X-RapidAPI-Key': '7b699d9949msh37c47cc6e674de0p12d44cjsnfe9be2a5a9f4',
//   'X-RapidAPI-Host': 'premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com',
// };

// Future<void> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse(url), headers: headers);
//     if (response.statusCode == 200) {
//       final result = response.body;
//       print(result); // The response text from the API

//       // Now you can convert the JSON response into a list of PhotosModel objects
//       final List<dynamic> data = jsonDecode(result);
//       final List<PhotosModel> photosList = data.map((json) => PhotosModel.fromApiToApp(json)).toList();

//       // You can use the photosList for further processing
//       // ...
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error occurred: $error');
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/photos_model.dart';

class WallpaperAPI {
  static const String apiKey =
      'api_key';
  static const String host =
      'premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com';
  static const String baseUrl =
      'https://premium-anime-mobile-wallpapers-illustrations.p.rapidapi.com/rapidHandler/recent?page=1&sensitivity=0&quality=1';

  

  Future<List<AnimeWallpaper>> fetchRandomWallpapers({int count = 10}) async {
    final response = await http.get(Uri.parse(baseUrl), headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      print(jsonData);

      List<AnimeWallpaper> wallpapers =
          jsonData.map((item) => AnimeWallpaper.fromJson(item)).toList();
      return wallpapers;
    } else {
      throw Exception('Failed to load random wallpapers22');
    }
  }
}
