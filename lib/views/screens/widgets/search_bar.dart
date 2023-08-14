import 'package:flutter/material.dart';

class SearchBarTab extends StatelessWidget {
  const SearchBarTab({super.key, required this.searchController, required this.onSubmitted});
  final TextEditingController searchController;
  final Function onSubmitted;

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
        
          color: Colors.white
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: onSubmitted(),
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search here...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusColor: Colors.amber
                
              ),
              

            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
           icon: const Icon(Icons.search,color: Colors.black,)
           )
        ],
      )
    );
  }
}