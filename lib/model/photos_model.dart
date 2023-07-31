// class PhotosModel {
//   final String imgSrc;
//   final String photoName;

//   PhotosModel({required this.imgSrc,required this.photoName});

//   static PhotosModel fromApiToApp(Map<String, dynamic> json) {
//     return PhotosModel(
//       imgSrc: json["src"]["portrait"],
//       photoName: json["alt"],
//     );
//   }
// }


// class Wallpaper {
//   final String imageUrl;
//   final String title;
//   final String author;

//   Wallpaper({
//     required this.imageUrl,
//     required this.title,
//     required this.author,
//   });

//   factory Wallpaper.fromJson(Map<String, dynamic> json) {
//     return Wallpaper(
//       imageUrl: json['imageUrl'],
//       title: json['title'],
//       author: json['author'],
//     );
//   }
// }


class AnimeWallpaper {
  final String artId;
  final String animeName;
  final String artUrl;
  final int sensitivity;

  AnimeWallpaper({
    required this.artId,
    required this.animeName,
    required this.artUrl,
    required this.sensitivity,
  });

  factory AnimeWallpaper.fromJson(Map<String, dynamic> json) {
    return AnimeWallpaper(
      artId: json['art_id'],
      animeName: json['animename'],
      artUrl: json['arturl'],
      sensitivity: json['sensitivity'],
    );
  }
}
