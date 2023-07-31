import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/cat_block.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomeAppBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBarTab(),
            SizedBox(
              height: 30,
            
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height - 200,
             
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
              ), itemBuilder:(context,index)=>Container(
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('https://images.pexels.com/photos/67826/jellyfish-luminous-jellyfish-light-light-phenomenon-67826.jpeg?auto=compress&cs=tinysrgb&w=600',fit: BoxFit.cover,),
              ),
              ),),
            )
          ],
        ),
      )
    );
  }
}