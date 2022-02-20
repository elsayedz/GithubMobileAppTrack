import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenName = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Sign Up Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
