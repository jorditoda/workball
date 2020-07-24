import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String text;

  InputLabel({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 19, color: Colors.white, fontFamily: "Montserrat-Bold"),
    );
  }
}
