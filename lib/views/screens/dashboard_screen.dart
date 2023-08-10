import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_flutter/views/screens/favrouits.dart';
import 'package:wallpaper_app_flutter/views/screens/home.dart';
import 'package:wallpaper_app_flutter/views/screens/settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        shape: CircularNotchedRectangle(),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            _icon.length,
            (index) => Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                icon: Icon(
                  _icon[index],
                  size: 34,
                  color: _selectedIndex == index
                      ? Colors.green
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  List<IconData> _icon = [
    CupertinoIcons.heart,
    CupertinoIcons.collections,
    CupertinoIcons.slider_horizontal_3
  ];

  List<Widget> _pages = [
    FavoriteScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];
}


// Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: List.generate(
//                     _icon.length,
//                     (index) => Center(
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             _selectedIndex = index;
//                           });
//                         },
//                         icon: Icon(
//                           _icon[index],
//                           size: 34,
//                           color: _selectedIndex == index
//                               ? Colors.green
//                               : Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )