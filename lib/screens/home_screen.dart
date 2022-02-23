import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome To Github Mobile Track\n Lets get started"),
      ),
    );
  }
}
