import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/widgets/custome_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomeAppBar(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
           
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network('https://images.pexels.com/photos/1335971/pexels-photo-1335971.jpeg?auto=compress&cs=tinysrgb&w=600',fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.black.withOpacity(0.4),
                    child: const Center(
                      child: Text('category name',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height - 200,
             
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
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