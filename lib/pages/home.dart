import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage.homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          ),

        ),
    );
  }
}
