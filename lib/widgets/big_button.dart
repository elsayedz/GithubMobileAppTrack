import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final Color colour;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final FontWeight fontWeight;

  BigButton(
      {required this.title,
      this.textColor = Colors.black,
      this.colour = Colors.blue,
      this.borderColor = Colors.blue,
      this.fontWeight = FontWeight.bold,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colour,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: BorderSide(
            color: borderColor ?? colour,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 14.0, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
