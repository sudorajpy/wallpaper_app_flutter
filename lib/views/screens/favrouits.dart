import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorites_provider.dart';
import 'full_screen.dart';


class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Wallpapers'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height-50,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: favoriteProvider.favorites.length,
          itemBuilder: (context, index) {
            final imgUrl = favoriteProvider.favorites[index];
            return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreen(
                              imgUrl: imgUrl,
                            ),
                          ),
                        );
                      },
                       child: Container(
                         margin: const EdgeInsets.all(8),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           image: DecorationImage(
                             image: NetworkImage(imgUrl,),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     );
          },
        ),
      ),
    );
  }
}
