import 'package:flutter/material.dart';

class SearchBarTab extends StatelessWidget {
  const SearchBarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),],
          color: Colors.white
      ),
      child: const Row(
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
          Icon(Icons.search,color: Colors.black,)
        ],
      )
    );
  }
}