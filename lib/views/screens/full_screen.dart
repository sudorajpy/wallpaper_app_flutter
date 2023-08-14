
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../provider/favorites_provider.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  bool isloading = false;

  Future<void> setWallpaper(String url) async {
    try {
    
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
    // if (result==true) {
    //   SnackBar(content: Text("Wallpaper set successfully"));
    // }
    } on PlatformException {
      print("$PlatformException");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imgUrl), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 10,
              child: Hero(
                  tag: widget.imgUrl,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                          size: 30,
                        )),
                  )),
            ),
            Positioned(
              bottom: 60,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (Provider.of<FavoriteProvider>(context,
                                  listen: false)
                              .favorites
                              .contains(widget.imgUrl)) {
                            final favoriteProvider =
                                Provider.of<FavoriteProvider>(
                              context,
                              listen: false,
                            );
                            favoriteProvider.removeFromFavorites(widget.imgUrl);
                          } else {
                            final favoriteProvider =
                                Provider.of<FavoriteProvider>(
                              context,
                              listen: false,
                            );
                            favoriteProvider.addToFavorites(widget.imgUrl);
                          }
                          setState(() {});
                        },
                        icon: Provider.of<FavoriteProvider>(context,
                                    listen: false)
                                .favorites
                                .contains(widget.imgUrl)
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                size: 28,
                                color: Colors.red,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                size: 28,
                                color: Colors.black,
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isloading = true;
                        });
                        await setWallpaper(widget.imgUrl);
                        setState(() {
                          isloading = false;

                        });
                              // Show the snackbar with glass effect
      Fluttertoast.showToast(
        msg: 'Wallpaper applied successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white.withOpacity(0.8), // Glass effect color
        textColor: Colors.black,
      );

                      },
                      child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: isloading
                                ? const SizedBox(
                                  width: 40,
                                  child: CircularProgressIndicator(
                                    
                                  ),
                                )
                                : const Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Share.share(widget.imgUrl);
                      },
                      child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            CupertinoIcons.share,
                            size: 28,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// void _showApplyOptionsDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Apply Wallpaper To:'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Apply as Home Screen Wallpaper
//                 Navigator.pop(context); // Close the dialog
//                 // _applyWallpaperToHomeScreen();
//               },
//               child: Text('Home Screen'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Apply as Lock Screen Wallpaper
//                 Navigator.pop(context); // Close the dialog
//                 // _applyWallpaperToLockScreen();
//               },
//               child: Text('Lock Screen'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Apply as Both Home Screen and Lock Screen Wallpaper
//                 Navigator.pop(context); // Close the dialog
//                 // _applyWallpaperToBoth();
//               },
//               child: Text('Both'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
}
