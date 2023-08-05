import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 10,
              child: Hero(
                  tag: imgUrl,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                          size: 30,
                        )),
                  )),
            ),
            Positioned(
              bottom: 60,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: LikeButton(

                          size: 30,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 30,

                            );
                          },
                        )),
                    Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        )),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Icon(Icons.file_download_outlined,weight: 64,)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
