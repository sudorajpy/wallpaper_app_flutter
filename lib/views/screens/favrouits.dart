import 'package:flutter/material.dart';

class FavrouitsScreen extends StatelessWidget {
  const FavrouitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-60,

      color: Colors.yellowAccent,
    );
  }
}