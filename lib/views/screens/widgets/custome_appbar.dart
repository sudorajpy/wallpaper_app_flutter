import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: 'Wallpaper ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const TextSpan(
            text: 'App',
            style: TextStyle(
              color: Colors.amberAccent,
            ),
          ),
        ]
      )),
    );
  }
}