import 'package:flutter/material.dart';

class SearchBarTab extends StatelessWidget {
  const SearchBarTab({super.key});

  @override
  Widget build(BuildContext context) {


    List searchResult = [];



    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(32),
        
          color: Colors.white
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                // prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusColor: Colors.amber
                
              ),
              

            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
           icon: Icon(Icons.search,color: Colors.black,)
           )
        ],
      )
    );
  }
}